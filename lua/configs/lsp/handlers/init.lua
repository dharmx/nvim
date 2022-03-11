local M = {}

local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

M.handlers = {
  ["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = border, focusable = false }),
  ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = border, focusable = false }),
  ["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, { virtual_text = { prefix = "■", spacing = 1 }, signs = true, underline = true, update_in_insert = false, severity_sort = true }),
  ["textDocument/definition"] = require("configs.lsp.handlers.definition").goto_definition "vs",
  ["textDocument/references"] = lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
  ["textDocument/formatting"] = require("configs.lsp.handlers.format").format
}

M.setup = function()
  for handler, config in pairs(M.handlers) do
    lsp.handlers[handler] = config
  end
end

return M

-- vim:ft=lua
