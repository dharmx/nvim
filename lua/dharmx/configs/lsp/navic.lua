local ok, navic = pcall(require, "nvim-navic")
if not ok then return end

navic.setup({
  icons = require("dharmx.utils.kind"),
  highlight = true,
  depth_limit = 0,
  separator = "  ",
  depth_limit_indicator = "… ",
  safe_output = true,
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
