local mason_ok, mason = pcall(require, "mason-lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
local lsp_ok, lsp = pcall(require, "lspconfig")
local navic_ok, navic = pcall(require, "nvim-navic")
pcall(require, "mason-null-ls")

if not (mason_ok and cmp_ok and lsp_ok and navic_ok) then return end
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

vim.lsp.set_log_level("warn")
vim.lsp.protocol.CompletionItemKind = require("core.kinds")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.diagnostic.config({
  virtual_text = { prefix = " ", source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always", border = "solid" },
})

local capabilities = cmp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.semanticHighlighting = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } }
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }

local opts = {
  autostart = true,
  init_options = { documentFormatting = true },
  flags = { debounce_text_changes = 150 },
  on_attach = function(client, buffer)
    local opts = { buffer = buffer }
    if client.name == "clangd" then client.server_capabilities.offsetEncoding = "UTF-8" end

    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<space>wl", function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    map("n", "<space>D", vim.lsp.buf.type_definition, opts)
    map("n", "<space>rn", require("plugins.lsp.rename").lsp_rename, opts)
    map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<space>f", function() vim.lsp.buf.format { async = true } end, opts)

    local LSP_GROUP = vim.api.nvim_create_augroup("LSPGroup", {})
    if client.supports_method("textDocument/codeLens") then
      autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" }, {
        callback = vim.lsp.codelens.refresh,
        group = LSP_GROUP,
        buffer = buffer,
      })
    end

    if client.config.flags then client.config.flags.allow_incremental_sync = true end
    if client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
    client.server_capabilities.semanticTokensProvider = nil
  end,
  capabilities = capabilities,
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "solid", focusable = true }),
    ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "solid", focusable = true }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }),
  },
}

require("neodev")
local ignore = { "rust_analyzer", "jdtls" }
mason.setup_handlers({
  function(name)
    if vim.tbl_contains(ignore, name) then return end
    local opts_ok, more_opts = pcall(require, "plugins.lsp.servers." .. name)
    lsp[name].setup(vim.tbl_deep_extend("keep", opts, opts_ok and more_opts or opts))
  end,
})
