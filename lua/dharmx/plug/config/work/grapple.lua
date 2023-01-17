local ok, grapple = pcall(require, "grapple")
if not ok then return end
local MainConfig = require("dharmx")

grapple.setup({
  log_level = "warn",
  scope = "git",
  popup_options = {
    relative = "editor",
    width = 60,
    height = 12,
    style = "minimal",
    focusable = true,
    border = MainConfig.ui.border,
  },
  integrations = {
    resession = false,
  },
})

-- vim:filetype=lua
