local ok, navic = pcall(require, "nvim-navic")
if not ok then return end
local kind = require("dharmx.util.kind")

navic.setup({
  icons = kind,
  highlight = true,
  depth_limit = 0,
  separator = "  ",
  depth_limit_indicator = "… ",
  safe_output = true,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- vim:filetype=lua
