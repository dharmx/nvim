local M = {}

local neovim = require("utils.neovim")
local augroup = neovim.augroup
local autocmd = neovim.autocmd
local lsp = vim.lsp
local diag = vim.diagnostic

---@diagnostic disable-next-line: unused-local
M.setup = function(client, buffer)
  if client.supports_method "textDocument/codeLens" then
    autocmd({ 
      "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" 
    }, lsp.codelens.refresh, { buffer = buffer })
    vim.schedule(lsp.codelens.refresh)
  end

  if client.supports_method("textDocument/documentHighlight") then
    augroup("LspDocumentHighlight", {
      {
        events = { "CursorHold", "CursorHoldI" },
        command = lsp.buf.document_highlight,
        options = { buffer = buffer },
      },
      {
        events = { "CursorMoved", "InsertEnter", "CursorMovedI" },
        command = lsp.buf.clear_references,
        options = { buffer = buffer },
      },
    })
  end

  autocmd("CursorHold", require("nvim-lightbulb").update_lightbulb, { buffer = buffer })
  autocmd("CursorHold", function()
    diag.open_float(nil, { focus = false, scope = "cursor", border = "solid" })
  end)

  -- autocmd("CursorHold", function() diag.open_float(nil, { focus = false, border = "solid" }) end)
end

return M

-- vim:ft=lua
