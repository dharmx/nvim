return {
  setup = function(client, buffer)
    if client then
      _cap = client.resolved_capabilities
      local augroups = require "configs.lsp.autocmds.list"
      for _, name in pairs {
        "LspDiagnosticsAtCursorLocation",
        "LspCodeActions",
        "LspDocumentHighlight",
      } do
        augroup(name, augroups[name])
      end
    end
  end,
}

-- vim:ft=lua
