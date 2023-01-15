local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

vim.diagnostic.config({
  virtual_text = { prefix = " ", source = "always" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always" },
})

local servers = require("dharmx.list.server")
local navic = require("nvim-navic")
local cmp = require("cmp_nvim_lsp")
local format = require("lsp-format")

local function on_attach(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local options = { noremap = true, silent = true, buffer = buffer }
  local bnnmap = vim.keymap.set

  bnnmap("n", "gD", vim.lsp.buf.declaration, options)
  bnnmap("n", "gd", vim.lsp.buf.definition, options)
  bnnmap("n", "K", vim.lsp.buf.hover, options)
  bnnmap("n", "gi", vim.lsp.buf.implementation, options)
  bnnmap("n", "<C-k>", vim.lsp.buf.signature_help, options)
  bnnmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, options)
  bnnmap("n", "<leader>'", vim.diagnostic.goto_next, options)
  bnnmap("n", "<leader>;", vim.diagnostic.goto_prev, options)
  bnnmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, options)
  bnnmap("n", "<leader>wl", function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, options)
  bnnmap("n", "<leader>D", vim.lsp.buf.type_definition, options)
  bnnmap("n", "<leader>rn", require("dharmx.plug.config.lsp.handlers.rename").lsp_rename, options)
  bnnmap("n", "<leader>ca", vim.lsp.buf.code_action, options)
  bnnmap("n", "gr", vim.lsp.buf.references, options)
  bnnmap("n", "<leader>f", vim.cmd.Format, options)

  require("dharmx.plug.config.lsp.presets.autocmd").setup(client, buffer)
  require("dharmx.plug.config.lsp.presets.cmd").setup(client, buffer)
  require("vim.lsp.protocol").CompletionItemKind = require("dharmx.list.kind").item

  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
  format.on_attach(client)
end

local function capabilities(client_name)
  local capability = vim.lsp.protocol.make_client_capabilities()
  capability.textDocument.completion.completionItem.snippetSupport = true
  capability.textDocument.completion.completionItem.preselectSupport = true
  capability.textDocument.completion.completionItem.insertReplaceSupport = true
  capability.textDocument.completion.completionItem.labelDetailsSupport = true
  capability.textDocument.completion.completionItem.deprecatedSupport = true
  capability.textDocument.completion.completionItem.commitCharactersSupport = true
  capability.textDocument.semanticHighlighting = true
  capability.textDocument.completion.completionItem.tagSupport = {
    valueSet = { 1 },
  }
  capability.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capability.textDocument.completion.completionItem.documentationFormat = {
    "markdown",
    "plaintext",
  }
  if client_name == "clangd" then capability.offsetEncoding = "utf-8" end
  cmp.default_capabilities()
  return capability
end

local function handlers()
  return {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "solid",
      focusable = false,
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "solid",
      focusable = false,
    }),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "■",
        spacing = 1,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }),
    ["textDocument/definition"] = require("dharmx.plug.config.lsp.handlers.definition").goto_definition("vs"),
    ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
  }
end

local function flags() return { debounce_text_changes = 150 } end

require("dharmx.plug.config.lsp.presets.icon")
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    autostart = true,
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = flags(),
    capabilities = capabilities(server),
    handlers = handlers(),
  })
end

-- vim:filetype=lua
