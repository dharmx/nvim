local M = {}

M["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "solid", focusable = false })

M["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "solid", focusable = false })

M["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = "■", spacing = 1 },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

M["textDocument/definition"] = require("configs.lsp.handlers.definition").goto_definition "vs"

M["textDocument/references"] = lsp.with(lsp.handlers["textDocument/references"], { loclist = true })

M["textDocument/formatting"] = require("configs.lsp.handlers.format").format

return M

-- vim:ft=lua
