local ok, mason_null = pcall(require, "mason-null-ls")
if not ok then return end
local MainConfig = require("dharmx")

mason_null.setup({
  ensure_installed = MainConfig.tools.null,
  automatic_installation = true,
  automatic_setup = true,
})

mason_null.setup_handlers()

-- vim:filetype=lua
