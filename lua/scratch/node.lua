---@diagnostic disable: missing-fields
local M = {}

local T = vim.treesitter
local V = vim.fn
local A = vim.api

local J = require("plenary.job")
local util = require("nvim-treesitter.ts_utils")

local presets = {
  stdin_comply = function(node, text, ...)
    J:new({
      ...,
      writer = J:new({ "echo", vim.trim(text) }),
      on_exit = vim.schedule_wrap(function(self, code)
        if code ~= 0 then return end
        local start_row, start_col, end_row, end_col = node:range()
        local results = self:result()
        table.insert(results, 1, "")
        table.insert(results, "")
        A.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, results)
      end)
    }):start()
  end,
  -- add more (like ones that do not support STDIN)
}

local handlers = {
  sql_formatter = function()
    if V.executable("sql-formatter") == 0 then return end
    local node = util.get_node_at_cursor(0)
    if not node or node:type() ~= "string_content" then return end -- add more cases
    presets.stdin_comply(node, T.get_node_text(node, 0), "sql-formatter", "-l", "sqlite")
  end,
  -- add more
}

function M._choose(on_complete, ...)
  local choices = { ... }
  if type(choices[1]) == "table" then choices = choices[1] end
  local Menu = require("nui.menu") -- {{{
  local options = {
    relative = "editor",
    position = {
      row = "50%",
      col = "50%",
    },
    border = {
      style = "solid",
      text = {
        top = "Handlers",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:NormalFloat",
    }
  } -- }}}

  Menu(options, {
    lines = vim.tbl_map(function(choice) return Menu.item(choice) end, choices),
    min_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = on_complete,
  }):mount()
end

function M.apply()
  M.choose(function(item)
    if handlers[item.text] then handlers[item.text]() end
  end, vim.tbl_keys(handlers))
end

return M
