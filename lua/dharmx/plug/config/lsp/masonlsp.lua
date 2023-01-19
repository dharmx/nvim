local ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ok then return end
local MainConfig = require("dharmx")

mason_lsp.setup({
  ensure_installed = MainConfig.servers,
  automatic_installation = true,
})

-- vim:filetype=lua
