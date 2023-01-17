local ok, code = pcall(require, "codewindow")
if not ok then return end
local MainConfig = require("dharmx")

code.setup({
  active_in_terminals = false,
  auto_enable = false,
  exclude_filetypes = MainConfig.black.filetype,
  minimap_width = 15,
  use_lsp = true,
  use_treesitter = true,
  use_git = true,
  width_multiplier = 4,
  z_index = 1,
  show_cursor = true,
  window_border = "none",
})

-- vim:filetype=lua
