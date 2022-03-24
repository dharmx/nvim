local M = {}

M["LspDocumentHighlight"] = {
  {
    events = { "CursorHold", "CursorHoldI" },
    command = lsb.document_highlight,
    options = { buffer = buffer },
  },
  {
    events = { "CursorMoved", "InsertEnter", "CursorMovedI" },
    command = lsb.clear_references,
    options = { buffer = buffer },
  },
}

M["LspCodeActions"] = {
  {
    events = "CursorHold",
    command = require("nvim-lightbulb").update_lightbulb,
    options = { buffer = buffer },
  },
}

M["LspDiagnosticsAtCursorLocation"] = {
  {
    events = "CursorHold",
    command = function()
      diagnostic.open_float(nil, { focus = false, scope = "cursor", border = "solid" })
    end,
  },
}

M["LspDiagnosticsAtCursorLineLocation"] = {
  {
    events = "CursorHold",
    command = function()
      diagnostic.open_float(nil, { focus = false, border = "solid" })
    end,
  },
}

return M

-- vim:ft=lua
