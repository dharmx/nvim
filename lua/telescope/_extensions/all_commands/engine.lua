-- Use: vim.keymap.set("n", "<leader>cc", ":lua require'commands'.picker()<CR>")
-- Explore the configuration section for more customization options.

-- Imports {{{
local M = {}

local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")

local entry_display = require("telescope.pickers.entry_display")
local actions_state = require("telescope.actions.state")
local make_entry = require("telescope.make_entry")

local if_nil = vim.F.if_nil
local A = vim.api
-- }}}

-- Configuration {{{
M._defaults = {
  icons = {
    builtin = " ",
    custom = " ",
    separator = " ",
  },
  mappings = {
    ["i"] = {
      ["<C-J>"] = actions.move_selection_next,
      ["<C-K>"] = actions.move_selection_previous,
    },
    ["n"] = {
      ["<C-J>"] = actions.move_selection_next,
      ["<C-K>"] = actions.move_selection_previous,
    },
  },
  apply_highlights = true,
  on_close = function(choice)
    if choice.type == "builtin" then
      vim.cmd(choice.description)
      return
    end
    vim.notify(choice.description)
  end,
}

M._config = vim.deepcopy(M._defaults)
-- }}}

-- Private {{{
function M.resulter(_)
  local custom_commands = A.nvim_get_commands({})
  local all_commands = vim.fn.getcompletion("", "command", false)
  local merged = {}
  for _, command in ipairs(all_commands) do
    if command:sub(1, 1):match("^[a-z]$") then
      merged[command] = { type = "builtin", description = ":help :" .. command }
    elseif custom_commands[command] then
      if custom_commands[command].definition == "" then
        merged[command] = { type = "custom", description = "No description found." }
      else
        merged[command] = { type = "custom", description = custom_commands[command].definition }
      end
    end
  end
  local unique = {}
  for command, metadata in pairs(merged) do
    table.insert(unique, { description = metadata.description, command = command, type = metadata.type })
  end
  return unique
end

function M.generate_maker(options)
  local icons = options.icons
  local displayer = entry_display.create({
    separator = icons.separator,
    items = {
      { width = 3 },
      { width = 50 },
      { remaining = true },
    },
  })

  local function make_display(entry)
    local command_type, command_type_hl = icons.builtin, "CommandsIconBuiltin"
    local command, command_hl = entry.value.command, "CommandsCommand"
    local description, description_hl = entry.value.description, "CommandsDescription"

    if entry.value.description == "No description found." then description_hl = "CommandsNoDescription" end
    if entry.value.type == "custom" then command_type, command_type_hl = icons.custom, "CommandsIconCustom" end
    return displayer({
      { command_type, command_type_hl },
      { command, command_hl },
      { description, description_hl },
    })
  end

  return function(entry)
    return make_entry.set_default_entry_mt({
      value = entry,
      ordinal = entry.command,
      display = make_display,
    }, options)
  end
end

function M.finder(options, results)
  return finders.new_table({
    results = results,
    entry_maker = M.generate_maker(options)
  })
end
-- }}}

function M.picker(options)
  options = if_nil(options, {})
  options = vim.tbl_deep_extend("keep", options, M._config)

  -- Picker {{{
  local results = M.resulter(options)
  local picker = pickers.new(options, {
    prompt_title = "Commands",
    finder = M.finder(options, results),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(buffer, map)
      local current_picker = actions_state.get_current_picker(buffer)
      for mode, mapping in pairs(options.mappings) do
        for key, action in pairs(mapping) do
          map(mode, key, action)
        end
      end

      actions.close:replace(function()
        local window = current_picker.original_win_id
        local valid, cursor = pcall(A.nvim_win_get_cursor, window)
        actions.close_pum(buffer)
        pickers.on_close_prompt(buffer)
        pcall(A.nvim_set_current_win, window)
        if valid and A.nvim_get_mode().mode == "i" and current_picker._original_mode ~= "i" then
          pcall(A.nvim_win_set_cursor, window, { cursor[1], cursor[2] + 1 })
        end
      end)
      actions.select_default:replace(function()
        actions.close(buffer)
        options.on_close(actions_state.get_selected_entry().value)
      end)
      return true
    end,
  })
  -- }}}
  picker:find()
end

-- Optional
function M.setup(options)
  options = if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  if not options.apply_highlights then return end
  A.nvim_set_hl(0, "CommandsIconBuiltin", { fg = "#7AB0DF" })
  A.nvim_set_hl(0, "CommandsCommand", { fg = "#C397D8" })
  A.nvim_set_hl(0, "CommandsDescription", { fg = "#FFE59E" })
  A.nvim_set_hl(0, "CommandsIconCustom", { fg = "#79DCAA" })
  A.nvim_set_hl(0, "CommandsNoDescription", { fg = "#F87070" })
end

return M
