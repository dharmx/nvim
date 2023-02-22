-- TODO:
-- + Implement range edits.
-- + Implement cycle-step hooks. Example on_next and on_prev.
-- + Implement incremental selection.
-- + Implement decremental selection.
-- + Implement {in|de}cremental selection.
-- + Implement selection by node types as oppsed to node types with a strict match.

-- To extend you may use M._internal changes are tracked there. {{{
local T = vim.treesitter
local Q = vim.treesitter.query
local L = vim.lsp.buf
local A = vim.api
local util = nil
local NAMESPACE = nil

local M = {}
M._internal = {}
M._config = {
  match = "NodeMatch",
  query = "(%s) @_",
  cmd = false,
  heavy = false,
  word = {
    enable = false,
    items = {
      "identifier",
      "property_identifier",
      "else_statement",
    },
  },
  ignore = {
    "chunk",
    "variable_declaration",
    "assignment_statement",
    "table_constructor",
    "block",
    "while_statement",
    "unary_expression",
    "if_statement",
    "function_declaration",
    "arguments",
    "for_statement",
    "return_statement",
    "dot_index_expression",
    "field",
  },
  map = {
    enable = false,
    items = {
      { "n", ";d", ":NodeNx<CR>", { desc = "Goto next match." } },
      { "n", ";s", ":NodeMh<CR>", { desc = "Match nodes with a custom string or, node#text." } },
      { "n", ";a", ":NodePv<CR>", { desc = "Goto prev match." } },
      { "n", ";w", ":NodeRm<CR>", { desc = "Remove match highlights." } },
      { "n", ";;", ":NodeTg<CR>", { desc = "Combine Node{Mh|Rm}." } },
      { "n", ";r", ":NodeRe<CR>", { desc = "Replace all matches." } },
    },
  },
}

local function any(key, items)
  for _, item in ipairs(items) do
    if key == item then return true end
  end
  return false
end

-- }}}

-- Auto-commands {{{
-- stolen from https://github.com/AlphaKeks
function M.word(nodes)
  nodes = vim.F.if_nil(nodes, M._config.word.items)
  M._internal.autocmd = vim.F.if_nil(M._internal.autocmd, {})
  if M._internal.autocmd.word then A.nvim_del_autocmd(M._internal.autocmd.word) end
  M._internal.autocmd.word = A.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function()
      local node = util.get_node_at_cursor()
      if not node then return end
      local node_text = Q.get_node_text(node, 0)

      if M._internal.current_node ~= node_text then
        M._internal.current_node = node_text
        L.clear_references()
        local node_type = T.get_node_at_cursor()
        if any(node_type, nodes) then L.document_highlight() end
      end
    end,
  })
end

function M.heavy()
  M._internal.autocmd = vim.F.if_nil(M._internal.autocmd, {})
  M._internal.autocmd.heavy = vim.F.if_nil(M._internal.autocmd.heavy, {})
  if M._internal.autocmd.heavy then
    for _, item in ipairs(M._internal.autocmd.heavy) do
      A.nvim_del_autocmd(item)
    end
  end
  table.insert(
    M._internal.autocmd.heavy,
    A.nvim_create_autocmd("CursorHold", { callback = function() pcall(M.match) end })
  )
  table.insert(
    M._internal.autocmd.heavy,
    A.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, { callback = function() M.unmatch() end })
  )
end

-- }}}

-- Helper functions. {{{
local function _input(actions, options)
  local ok, Input = pcall(require, "nui.input")
  if not ok then
    vim.ui.input(
      { prompt = "Replacement: " },
      vim.F.if_nil(
        vim.F.if_nil(actions, {}).on_submit,
        { on_submit = function(value) vim.notify(vim.inspect(value)) end }
      )
    )
    return
  end

  local autocmd = require("nui.utils.autocmd")
  local event = autocmd.event
  local NuiText = require("nui.text")

  actions = vim.F.if_nil(actions, {})
  options = vim.tbl_deep_extend("keep", vim.F.if_nil(options, {}), {
    border = {
      style = {
        top_left = NuiText(" ", "NUINormal"),
        top = NuiText("━", "NUILine"),
        top_right = NuiText(" ", "NUINormal"),
        left = NuiText(" ", "NUINormal"),
        right = NuiText(" ", "NUINormal"),
        bottom_left = NuiText(" ", "NUINormal"),
        bottom = NuiText(" ", "NUINormal"),
        bottom_right = NuiText(" ", "NUINormal"),
      },
      text = {
        top = NuiText("RENAME ", "NUIHeading"),
        top_align = "left",
      },
    },
    winblend = 0,
    highlight = "NUIText:NUIText",
    relative = "cursor",
    position = {
      row = 1,
      col = 0,
    },
    size = {
      width = 25,
      height = 1,
    },
  })

  local input = Input(options, {
    default_value = vim.F.if_nil(actions.default_value, "Enter a value!"),
    on_submit = actions.on_submit,
    on_close = actions.on_close,
    on_change = actions.on_change,
    prompt = NuiText(" ﬦ ", "NUIPrompt"),
  })
  input:mount()

  local keyword = vim.opt.iskeyword - "_" - "-"
  vim.bo.iskeyword = table.concat(keyword:get(), ",")
  vim.schedule(function() A.nvim_command("stopinsert") end)

  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:map("n", "q", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

local function _cycle(apply, position)
  if not apply then
    position = M._internal.state.current.position
    local total = #M._internal.state.nodes
    return math.min(math.max(1, position), total), total
  end
  M._internal.state.current.position = position
  local node = M._internal.state.nodes[position]
  A.nvim_win_set_cursor(0, { node[1] + 1, node[2] })
end

-- }}}

-- Cycle functions. {{{
function M.cycle_next()
  if not M._internal.state.current then return end
  local position, total = _cycle(false)
  if position == total then position = 0 end
  _cycle(true, position + 1)
end

function M.cycle_prev()
  if not M._internal.state.current then return end
  local position, total = _cycle(false)
  if position == 1 then position = total + 1 end
  _cycle(true, position - 1)
end

-- }}}

-- Functions related to M._internal manipulation {{{
function M.replace(replacement)
  for _, range in ipairs(M._internal.state.nodes) do
    A.nvim_buf_set_text(0, range[1], range[2], range[3], range[4], replacement)
  end
  M.unmatch()
end

-- }}}

-- Match and Unmatch {{{
function M.match(match_string)
  local search_node = T.get_node_at_cursor(0)
  if not search_node then return end

  local curse = util.get_node_at_cursor(0)
  if curse then
    curse = {
      range = { curse:range() },
      type = curse:type(),
      data = Q.get_node_text(curse, 1),
    }
  end
  if vim.tbl_contains(M._config.ignore, curse.type) then return end

  local query = string.format(M._config.query, search_node)
  local root = T.get_parser(0):parse()[1]:root()
  local parsed = Q.parse_query(vim.bo.filetype, query)
  M._internal.state = { nodes = {}, current = curse }

  ---@diagnostic disable-next-line: missing-parameter
  for _, node, _ in parsed:iter_captures(root, query) do
    if not curse then break end
    local data = Q.get_node_text(node, 0)
    if match_string == curse.data or data == curse.data then
      local range = { node:range() }
      table.insert(M._internal.state.nodes, range)

      ---@diagnostic disable-next-line: param-type-mismatch
      vim.highlight.range(0, NAMESPACE, M._config.match, { range[1], range[2] }, { range[3], range[4] }, {})
    end
  end

  if curse then
    for index, info in ipairs(M._internal.state.nodes) do
      if
        info[1] == curse.range[1]
        and info[2] == curse.range[2]
        and info[3] == curse.range[3]
        and info[4] == curse.range[4]
      then
        M._internal.state.current.position = index
        break
      end
    end
  end
end

function M.unmatch()
  M._internal.state = vim.F.if_nil(M._internal.state, {})
  A.nvim_buf_clear_namespace(0, NAMESPACE, 0, -1)
  M._internal.state = nil
end

-- }}}

-- Plugin utils {{{
function M.cmd()
  A.nvim_create_user_command("NodeNx", function() M.cycle_next() end, { desc = M._config.map.items[1][4] })
  A.nvim_create_user_command("NodePv", function() M.cycle_prev() end, { desc = M._config.map.items[2][4] })
  A.nvim_create_user_command("NodeRm", function() M.unmatch() end, { desc = M._config.map.items[3][4] })
  A.nvim_create_user_command("NodeMh", function(...) M.match((...).fargs[1]) end, {
    desc = M._config.map.items[4][4],
    nargs = "?",
  })
  A.nvim_create_user_command("NodeTg", function()
    if M._internal.state then
      M.unmatch()
    else
      pcall(M.match)
    end
  end, { desc = M._config.map.items[5][4] })
  A.nvim_create_user_command("NodeRe", function(...)
    local arg = (...).fargs[1]
    if arg then
      M.replace({ arg })
      return
    end
    _input({
      on_submit = function(value) M.replace({ vim.F.if_nil(value, "") }) end,
    })
  end, { desc = M._config.map.items[6][4], nargs = "?" })
end

function M.map()
  for _, map in ipairs(M._config.map.items) do
    vim.keymap.set(map[1], map[2], map[3], map[4])
  end
end

function M.setup(options)
  util = require("nvim-treesitter.ts_utils")
  NAMESPACE = A.nvim_create_namespace("NODE")
  A.nvim_set_hl_ns(NAMESPACE)

  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  local present, _ = pcall(A.nvim_get_hl_by_name, M._config.match, true)
  if not present then A.nvim_set_hl(0, M._config.match, { background = "#16191F", bold = true }) end
  if M._config.word.enable then M.word() end
  if M._config.heavy then M.heavy() end
  if M._config.cmd then M.cmd() end
  if M._config.map.enable then M.map() end
end

-- }}}

return M
