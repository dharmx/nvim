local ok, navic = pcall(require, "nvim-navic")
if not ok then return end
local MainConfig = require("dharmx")

navic.setup({
  icons = MainConfig.kind.type,
  highlight = true,
  depth_limit = 0,
  separator = MainConfig.ui.navic.separator,
  depth_limit_indicator = MainConfig.ui.navic.depth,
  safe_output = true,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- vim:filetype=lua
