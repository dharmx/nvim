local M = {}

local ok, lightbulb = pcall(require, "nvim-lightbulb")
local util = require("dharmx.util.nvim")
local augroup = util.augroup
local autocmd = util.autocmd

M.setup = function(client, buffer, config)
  if config.lens and client.supports_method("textDocument/codeLens") then
    autocmd({
      "BufEnter",
      "InsertLeave",
      "BufWritePost",
      "CursorHold",
    }, vim.lsp.codelens.refresh, { buffer = buffer })
    vim.lsp.codelens.refresh()
  end

  if config.high and client.supports_method("textDocument/documentHighlight") then
    augroup("LspDocumentHighlight", {
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

  if config.diag then
    autocmd("InsertLeave", function() vim.diagnostic.disable(0) end)
    autocmd("InsertEnter", function() vim.diagnostic.enable(0) end)
  end

  if ok and config.bulb then autocmd("CursorHold", lightbulb.update_lightbulb, { buffer = buffer }) end
end

return M

-- vim:filetype=lua
