local mason_ok, mason = pcall(require, "mason-lspconfig")
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
local lsp_ok, lsp = pcall(require, "lspconfig")

if not (mason_ok and cmp_ok and lsp_ok) then return end

vim.lsp.set_log_level("warn")
vim.lsp.protocol.CompletionItemKind = require("core.kinds")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { source = "always", border = "solid" },
  virtual_text = { prefix = " ", source = "always" },
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
  on_attach = require("plugins.lsp.attach"),
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
  jdtls = function()
    if vim.bo.filetype ~= "java" then return end
    local jdtls = require("plugins.lsp.jdtls")
    local opts_ok, more_opts = pcall(require, "plugins.lsp.servers.jdtls")
    jdtls.setup(vim.tbl_deep_extend("keep", opts, opts_ok and more_opts or opts))
    jdtls.load_telescope()
  end
})
