local ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ok then return end

mason_lsp.setup({
  ensure_installed = require("dharmx.supply.server"),
  automatic_installation = true,
})

-- vim:filetype=lua
