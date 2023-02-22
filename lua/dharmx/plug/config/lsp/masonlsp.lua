local ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ok then return end
local servers = require("dharmx.util.servers")

mason_lsp.setup({
  ensure_installed = servers,
  automatic_installation = true,
})
