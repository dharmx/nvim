local M = {}

local ok, lightbulb = pcall(require, "nvim-lightbulb")
local util = require("dharmx.util.nvim")
local au = util.au
local aucmd = util.aucmd

M.setup = function(client, buffer, config)
  if client.supports_method("textDocument/codeLens") then
    aucmd({
      "BufEnter",
      "InsertLeave",
      "BufWritePost",
      "CursorHold",
    }, vim.lsp.codelens.refresh, { buffer = buffer })
    vim.lsp.codelens.refresh()
  end

  if client.supports_method("textDocument/documentHighlight") then
    au("LspDocumentHighlight", {
      {
        events = { "CursorHold", "CursorHoldI" },
        command = vim.lsp.buf.document_highlight,
        options = { buffer = buffer },
      },
      {
        events = { "CursorMoved", "InsertEnter", "CursorMovedI" },
        command = vim.lsp.buf.clear_references,
        options = { buffer = buffer },
      },
    })
  end

  aucmd("InsertLeave", function() vim.diagnostic.disable(0) end)
  aucmd("InsertEnter", function() vim.diagnostic.enable(0) end)
  if ok and config.bulb then aucmd("CursorHold", lightbulb.update_lightbulb, { buffer = buffer }) end
end

return M

-- vim:filetype=lua
