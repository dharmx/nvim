local present, trouble = pcall(require, "trouble")

if not present then
  return
end

local config = {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  action_keys = require("mappings").trouble_nvim,
  indent_lines = true, -- add an indent guide below the fold icons
  auto_open = true, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = true, -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠",
  },
  use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
}

trouble.setup(config)

-- vim:ft=lua
