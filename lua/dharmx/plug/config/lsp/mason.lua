local ok, mason = pcall(require, "mason")
if not ok then return end
local config = require("dharmx")

mason.setup({
  pip = {
    upgrade_pip = true,
  },
  max_concurrent_installers = 5,
  border = config.ui.border,
  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = "◍ ",
    },
  },
})

-- vim:filetype=lua
