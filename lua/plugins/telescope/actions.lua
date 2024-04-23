local M = {}

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")

function M.vertical(prompt_buffer)
  local picker = actions_state.get_current_picker(prompt_buffer)
  local selections = picker:get_multi_selection()
  local entry = actions_state.get_selected_entry()

  actions.close(prompt_buffer)
  if #selections < 2 then
    vim.cmd.edit(vim.split(entry.value, ":", { plain = true })[1])
  else
    for _, selection in ipairs(selections) do
      vim.cmd.edit(vim.split(selection.value, ":", { plain = true })[1])
    end
  end
end

function M.interactive_regex(prompt_buffer)
  actions.close(prompt_buffer)
  vim.ui.input({ prompt = "glob patterns(comma sep): " }, function(input)
    if not input then return end
    builtin.find_files({
      file_ignore_patterns = vim.split(vim.trim(input), ",", { plain = true }),
    })
  end)
end

function M.set_preview_filetype(prompt_buffer)
  local current_picker = actions_state.get_current_picker(prompt_buffer)
  local previewers = current_picker.all_previewers
  local current_previewer_index = current_picker.current_previewer_index
  local current_previewer = previewers[current_previewer_index]
  local previewer_buffer = current_previewer.state.bufnr
  vim.api.nvim_buf_set_option(previewer_buffer, "filetype", "")
end

-- {
--   bufnr = 1,
--   display = <function 1>,
--   filename = "lua/plugins/telescope/config.lua",
--   index = 2,
--   indicator = "#h  ",
--   lnum = 220,
--   ordinal = "1 : lua/plugins/telescope/config.lua",
--   value = "lua/plugins/telescope/config.lua",
--   <metatable> = {
--     __index = <function 2>
--   }
-- }
function M.delete_buffer(_)
  local entry = actions_state.get_selected_entry()
  if vim.api.nvim_buf_is_valid(entry.bufnr) then
    vim.api.nvim_buf_delete(entry.bufnr, { force = true })
    if vim.api.nvim_buf_is_valid(entry.bufnr) then
      vim.cmd.bdelete(entry.filename)
    end
  end
end

return require("telescope.actions.mt").transform_mod(M)
