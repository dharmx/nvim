local M = {}

---@diagnostic disable-next-line: unused-local
M.setup = function(client, buffer)
  augroup("LspDocumentHighlight", {
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
  })

  autocmd("CursorHold", require("nvim-lightbulb").update_lightbulb, { buffer = buffer })
  autocmd("CursorHold", function()
    diag.open_float(nil, { focus = false, scope = "cursor", border = "solid" })
  end)

  -- autocmd("CursorHold", function() diag.open_float(nil, { focus = false, border = "solid" }) end)
end

return M

-- vim:ft=lua
