local _lsp, lsp = pcall(require, "lspconfig")
if not _lsp then return end

local kind = require("dharmx.util.kind")
local _navic, navic = pcall(require, "nvim-navic")
local _cmp, cmp = pcall(require, "cmp_nvim_lsp")

local servers = require("dharmx.util.servers")
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

  -- autocmd.setup(client, buffer)
  -- cmd.setup(client, buffer)
  -- protocol.CompletionItemKind = kind
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if _navic and client.server_capabilities.documentSymbolProvider then navic.attach(client, buffer) end
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
  if _cmp then cmp.default_capabilities() end
  return capability
end

local function handlers()
  return {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "solid", focusable = false }),
    ["textDocument/definition"] = require("dharmx.plug.config.lsp.handlers.definition").goto_definition("vs"),
    ["textDocument/references"] = vim.lsp.with(vim.lsp.handlers["textDocument/references"], { loclist = true }),
    ["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = "solid", focusable = false }
    ),
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = { prefix = "■ ", spacing = 1 },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }),
  }
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

for _, name in ipairs(servers) do
  local server = lsp[name]
  if name == "rust_analyzer" then
    pcall(
      function()
        require("rust-tools").setup({
          server = vim.tbl_deep_extend("keep", {
            root_dir = require("lspconfig.util").root_pattern({ "Cargo.toml", "rust-project.json" }) or vim.loop.cwd(),
          }, configure(name)),
          tools = { hover_actions = { border = "solid" } },
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
