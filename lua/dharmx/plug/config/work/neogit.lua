local present, neogit = pcall(require, "neogit")
if not present then return end
local MainConfig = require("dharmx")

neogit.setup({
  signs = MainConfig.ui.neogit,
})

---vim:filetype=lua
