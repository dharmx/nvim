return {
  setup = function(client, buffer)
    if client and client.resolved_capabilities.document_highlight then
      local autocmds = {
        {
          events = { "CursorHold", "CursorHoldI" },
          command = lsp.buf.document_highlight,
          options = { buffer = buffer },
        },
        {
          events = "CursorMoved",
          command = lsp.buf.clear_references,
          options = { buffer = buffer },
        },
        {
          events = { "CursorHold", "CursorHoldI" },
          command = function()
            require("nvim-lightbulb").update_lightbulb()
          end,
          options = { buffer = buffer },
        },
      }
      augroup("LspDocumentHighlight", autocmds)
    end
  end,
}

-- vim:ft=lua
