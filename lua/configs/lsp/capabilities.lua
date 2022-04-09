local capabilities = lsp.protocol.make_client_capabilities()
local completion = capabilities.textDocument.completion.completionItem

for item, value in pairs {
  ["snippetSupport"] = true,
  ["preselectSupport"] = true,
  ["insertReplaceSupport"] = true,
  ["labelDetailsSupport"] = true,
  ["deprecatedSupport"] = true,
  ["commitCharactersSupport"] = true,
  ["tagSupport"] = { valueSet = { 1 } },
  ["resolveSupport"] = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  },
  ["documentationFormat"] = { "markdown", "plaintext" },
} do
  completion[item] = value
end

return capabilities

-- vim:ft=lua
