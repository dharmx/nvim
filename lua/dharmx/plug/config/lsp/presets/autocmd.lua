local M = {}

local ok, lightbulb = pcall(require, "nvim-lightbulb")
local util = require("dharmx.util").nvim
local group = util.group
local on = util.on

M.setup = function(client, buffer, config)
  if client.supports_method("textDocument/codeLens") then
    on({
      "BufEnter",
      "InsertLeave",
      "BufWritePost",
      "CursorHold",
    }, vim.lsp.codelens.refresh, { buffer = buffer })
    vim.lsp.codelens.refresh()
  end

  -- if client.supports_method("textDocument/documentHighlight") then
  --   group("LspDocumentHighlight", {
  --     {
  --       events = { "CursorHold", "CursorHoldI" },
  --       command = vim.lsp.buf.document_highlight,
  --       options = { buffer = buffer },
  --     },
  --     {
  --       events = { "CursorMoved", "InsertEnter", "CursorMovedI" },
  --       command = vim.lsp.buf.clear_references,
  --       options = { buffer = buffer },
  --     },
  --   })
  -- end

  -- on("InsertLeave", function() vim.diagnostic.enable(0) end)
  -- on("InsertEnter", function() vim.diagnostic.disable(0) end)
  if ok then on("CursorHold", lightbulb.update_lightbulb, { buffer = buffer }) end
end

return M
