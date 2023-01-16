local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

local config = require("dharmx")
local servers = require("dharmx.list.server")
local navic = require("nvim-navic")
local cmp = require("cmp_nvim_lsp")

local autocmd = require("dharmx.plug.config.lsp.presets.autocmd")
local cmd = require("dharmx.plug.config.lsp.presets.cmd")
local protocol = require("vim.lsp.protocol")

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
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, options)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, options)

  if config.lsp.autocmd.enable then autocmd.setup(client, buffer, config.lsp.autocmd) end
  if config.lsp.cmd then cmd.setup(client, buffer) end
  if config.kind then protocol.CompletionItemKind = config.kind end
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
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
  capability.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capability.textDocument.completion.completionItem.resolveSupport =
    { properties = { "documentation", "detail", "additionalTextEdits" } }
  capability.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  if client_name == "clangd" then capability.offsetEncoding = "utf-8" end
  cmp.default_capabilities()
  return capability
end

local function handlers()
  local items = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = config.ui.border, focusable = false }),
    ["textDocument/definition"] = require("dharmx.plug.config.lsp.handlers.definition").goto_definition("vs"),
    ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
    ["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = config.ui.border, focusable = false }
    ),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = { prefix = "■ ", spacing = 1 },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }),
  }
  if config.lsp.handlers then return items end
end

local function configure(server_name)
  local exists, defaults = pcall(require, "dharmx.plug.config.lsp.servers." .. server_name)
  if not exists then defaults = {} end

  return vim.tbl_deep_extend("keep", defaults, {
    autostart = true,
    init_options = { documentFormatting = true },
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities(server_name),
    handlers = handlers(),
  })
end

require("dharmx.plug.config.lsp.presets.icon")
for _, name in ipairs(servers) do
  local server = lspconfig[name]
  if name == "rust_analyzer" then
    pcall(
      function()
        require("rust-tools").setup({
          server = vim.tbl_deep_extend("keep", {
            root_dir = require("lspconfig.util").root_pattern({ "Cargo.toml", "rust-project.json" }) or vim.loop.cwd(),
          }, configure(name)),
          tools = { hover_actions = { border = config.ui.border } },
        })
      end
    )
  elseif name == "jdtls" then
    pcall(function() require("jdtls").start_or_attach(vim.tbl_deep_extend("keep", configure(name), server)) end)
  else
    server.setup(configure(name))
  end
end

-- vim:filetype=lua
