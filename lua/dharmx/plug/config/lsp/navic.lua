local ok, navic = pcall(require, "nvim-navic")
if not ok then return end

navic.setup({
  icons = require("dharmx.list.kind").type_icons,
  highlight = true,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "… ",
  safe_output = true,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- vim:filetype=lua
