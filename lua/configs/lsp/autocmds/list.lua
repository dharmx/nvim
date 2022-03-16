local M = {}

M["LspDocumentHighlight"] = {
  {
    events = { "CursorHold", "CursorHoldI" },
    command = function()
      if not _cap.document_highlight then
        return
      end
      buf.document_highlight()
    end,
    options = { buffer = buffer },
  },
  {
    events = { "CursorMoved", "InsertEnter" },
    command = function()
      if not _cap.document_highlight then
        return
      end
      buf.clear_references()
    end,
    options = { buffer = buffer },
  },
}

M["LspCodeActions"] = {
  {
    events = { "CursorHold", "CursorHoldI" },
    command = function()
      require("nvim-lightbulb").update_lightbulb()
    end,
    options = { buffer = buffer },
  },
}

M["LspDiagnosticsAtCursorLocation"] = {
  {
    events = { "CursorHold", "CursorHoldI" },
    command = function()
      diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "solid" })
    end,
  },
}

M["LspDiagnosticsAtCursorLineLocation"] = {
  {
    events = { "CursorHold", "CursorHoldI" },
    command = function()
      diagnostic.open_float(nil, { focus = false, border = "solid" })
    end,
  },
}

return M

-- vim:ft=lua
