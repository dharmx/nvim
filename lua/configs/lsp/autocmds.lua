return {
  setup = function(client, buffer)
    if client then
      local caps = client.resolved_capabilities
      local augroups = {}
      augroups["LspDocumentHighlight"] = {
        {
          events = { "CursorHold", "CursorHoldI" },
          command = function()
            if not caps.document_highlight then
              return
            end
            lsp.buf.document_highlight()
          end,
          options = { buffer = buffer },
        },
        {
          events = { "CursorMoved", "InsertEnter" },
          command = function()
            if not caps.document_highlight then
              return
            end
            lsp.buf.clear_references()
          end,
          options = { buffer = buffer },
        },
      }

      augroups["LspCodeActions"] = {
        {
          events = { "CursorHold", "CursorHoldI" },
          command = function()
            require("nvim-lightbulb").update_lightbulb()
          end,
          options = { buffer = buffer },
        },
      }

      augroups["LspDiagnosticsAtCursorLocation"] = {
        {
          events = { "CursorHold", "CursorHoldI" },
          command = function()
            vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "single" })
          end,
        },
      }

      augroups["LspDiagnosticsAtCursorLineLocation"] = {
        {
          events = { "CursorHold", "CursorHoldI" },
          command = function()
            vim.diagnostic.open_float(nil, { focus = false, border = "single" })
          end,
        },
      }

      for _, name in
        pairs {
          "LspDiagnosticsAtCursorLocation",
          "LspCodeActions",
          "LspDocumentHighlight",
        }
      do
        augroup(name, augroups[name])
      end
    end
  end,
}

-- vim:ft=lua
