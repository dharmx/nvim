local navic_ok, navic = pcall(require, "nvim-navic")

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

local function is_none_formatting_enabled(buffer)
  local generators = require("null-ls.generators")
  local methods = require("null-ls.methods")
  return #generators.get_available(vim.bo[buffer].filetype, methods.internal.FORMATTING) > 0
end

local function formatting(buffer)
  return function()
    vim.lsp.buf.format({
      async = true,
      filter = function(client)
        if vim.bo[buffer].filetype ~= "lua" and client.supports_method("textDocument/formatting") then
          return client.name
        end
        return client.name == "null-ls"
      end,
    })
  end
end

return function(client, buffer)
  vim.bo[buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
  local opts = { buffer = buffer }
  if client.name == "clangd" then client.server_capabilities.offsetEncoding = "UTF-8" end

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "<space>D", vim.lsp.buf.declaration, opts)
  map("n", "<space>d", vim.lsp.buf.definition, opts)
  map("n", "<space>t", vim.lsp.buf.type_definition, opts)
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  map("n", "<space>wa", vim.lsp.buf.remove_workspace_folder, opts)
  map("n", "<space>wd", function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  map("n", "<space>rn", require("plugins.lsp.rename").lsp_rename, opts)
  map("n", "<space>gr", vim.lsp.buf.references, opts)
  map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  map("n", "<space>f", formatting(buffer), opts)

  if client.server_capabilities.documentFormattingProvider then
    if client.name == "null-ls" and is_none_formatting_enabled(buffer) or client.name ~= "null-ls" then
      vim.bo[buffer].formatexpr = "v:lua.vim.lsp.formatexpr()"
      map("n", "<space>gq", formatting(buffer), opts)
    else
      vim.bo[buffer].formatexpr = nil
    end
  end

  local LSP_GROUP = vim.api.nvim_create_augroup("LSPGroup", {})
  if client.supports_method("textDocument/codeLens") then
    autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" }, {
      callback = vim.lsp.codelens.refresh,
      group = LSP_GROUP,
      buffer = buffer,
    })
  end

  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if navic_ok and client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
  client.server_capabilities.semanticTokensProvider = nil
end
