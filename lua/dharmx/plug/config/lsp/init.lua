---@diagnostic disable: unused-local
local _lsp, lsp = pcall(require, "lspconfig")
if not _lsp then return end

local _navic, navic = pcall(require, "nvim-navic")
local _cmp, cmp = pcall(require, "cmp_nvim_lsp")

local servers = require("dharmx.util.servers")
local kind = require("dharmx.util.kind")

local autocmd = require("dharmx.plug.config.lsp.presets.autocmd")
local cmd = require("dharmx.plug.config.lsp.presets.cmd")

local function on_attach(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local options = { noremap = true, silent = true, buffer = buffer }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, options)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, options)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, options)
  vim.keymap.set("n", "<leader>'", vim.diagnostic.goto_next, options)
  vim.keymap.set("n", "<leader>;", vim.diagnostic.goto_prev, options)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, options)
  vim.keymap.set(
    "n",
    "<leader>wl",
    function() vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    options
  )
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, options)
  vim.keymap.set("n", "<leader>rn", require("dharmx.plug.config.lsp.handlers.rename").lsp_rename, options)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, options)
  vim.keymap.set("n", "<leader>f", vim.cmd.Format, options)
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, options)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, options)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, options)

  autocmd.setup(client, buffer)
  cmd.setup(client, buffer)

  vim.lsp.protocol.CompletionItemKind = kind
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if _navic and client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
end

local function capabilities(name)
  local capability = vim.lsp.protocol.make_client_capabilities()
  capability.textDocument.completion.completionItem.snippetSupport = true
  capability.textDocument.completion.completionItem.preselectSupport = true
  capability.textDocument.completion.completionItem.insertReplaceSupport = true
  capability.textDocument.completion.completionItem.labelDetailsSupport = true
  capability.textDocument.completion.completionItem.deprecatedSupport = true
  capability.textDocument.completion.completionItem.commitCharactersSupport = true
  capability.textDocument.semanticHighlighting = true
  capability.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capability.textDocument.completion.completionItem.resolveSupport =
    { properties = { "documentation", "detail", "additionalTextEdits" } }
  capability.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }

  if name == "clangd" then capability.offsetEncoding = "utf-8" end
  if _cmp then cmp.default_capabilities() end
  return capability
end

local function configure(name)
  local exists, defaults = pcall(require, "dharmx.plug.config.lsp.servers." .. name)
  if not exists then defaults = {} end

  return vim.tbl_deep_extend("keep", {
    autostart = true,
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities(name),
    handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "solid", focusable = true }),
      ["textDocument/definition"] = require("dharmx.plug.config.lsp.handlers.definition").goto_definition("vs"),
      ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
      ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "solid", focusable = true }
      ),
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = { prefix = "● ", spacing = 1 },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      }),
    },
  }, defaults)
end

require("dharmx.plug.config.lsp.neoconf")
if vim.bo.filetype == "lua" then require("dharmx.plug.config.lsp.neodev") end

for _, name in ipairs(servers) do
  local server = lsp[name]
  if vim.bo.filetype == "rust" and name == "rust_analyzer" then
    local root_dir = require("lspconfig.util").root_pattern({ "Cargo.toml", "rust-project.json" }) or vim.loop.cwd()
    local _rust, rust = pcall(require, "rust-tools")
    if _rust then
      rust.setup({
        server = vim.tbl_deep_extend("keep", { root_dir = root_dir }, configure(name)),
        tools = { hover_actions = { border = "solid" } },
      })
    else
      server.setup({ root_dir = root_dir })
    end
  elseif vim.bo.filetype == "java" and name == "jdtls" then
    local jdtls = require("dharmx.plug.config.lsp.presets.jdtls")
    jdtls.setup(configure(name))
    jdtls.load_telescope()
  else
    server.setup(configure(name))
  end
end
