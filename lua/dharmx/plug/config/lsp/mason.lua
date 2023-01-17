local ok, mason = pcall(require, "mason")
if not ok then return end
local MainConfig = require("dharmx")

mason.setup({
  pip = {
    upgrade_pip = true,
  },
  max_concurrent_installers = 5,
  border = MainConfig.ui.border,
  ui = {
    icons = MainConfig.ui.mason,
  },
})

-- vim:filetype=lua
