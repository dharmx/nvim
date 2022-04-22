local M = {}

function M.setup(client, buffer)
  local signdef = require("utils.lsp").lsp_signdef
  signdef("DiagnosticSignError", "", "LspDiagnosticsSignError")
  signdef("DiagnosticSignWarn", "", "LspDiagnosticsSignWarning")
  signdef("DiagnosticSignInfo", "", "LspDiagnosticsSignInformation")
  signdef("DiagnosticSignHint", "", "LspDiagnosticsSignHint")
  require("vim.lsp.protocol").CompletionItemKind = require("tables.kinds").item
end

return M

-- vim:ft=lua
