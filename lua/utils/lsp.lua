--- LSP utility functions

local M = {}

local lsp = vim.lsp
local fn = vim.fn
local api = vim.api
local nv = require("utils.neovim")

--- Applies highlights and defines the icon to LSP symbols like
--- hints, warn, ... they are displayed at the number column.
-- @param group the highlight group of the symbol icon.
-- @param text_group the highlight group of the symbol text.
-- @param icon the symbol glyph
-- @see help sign_define
-- @see help vim.diagnostic.severity
function M.lsp_signdef(group, icon, text_group)
  fn.sign_define(group, {
    text = icon,
    texthl = text_group,
  })
end

function M.format(buffer)
  lsp.buf.format({
    timeout_ms = 3000, -- NOTE: Ignored if async is true.
    async = true,
    bufnr = buffer,
    filter = function(client)
      if vim.bo.filetype == "lua" then
        if client.name == "sumneko_lua" then
          return false
        end
        return client.name == "null-ls"
      end
      if client.name == "pyright" then
        return false
      end
      return true
    end,
    clients,
  })
end

function M.on_attach(notify)
  return function(client, buffer)
    require("mapping.lsp").setup(client, buffer)
    require("plugin.config.lsp.autocmds").setup(client, buffer)
    require("plugin.config.lsp.commands").setup(client, buffer)
    require("plugin.config.lsp.icons").setup(client, buffer)

    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end

    if notify ~= nil or notify then
      nv.notify({
        message = "LSP has been initialised.",
        title = "LSP: " .. client.name,
        icon = " ",
      })
    end
  end
end

function M.handlers()
  return {
    ["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
      border = "solid",
      focusable = false,
    }),
    ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
      border = "solid",
      focusable = false,
    }),
    ["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "■",
        spacing = 1,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }),
    ["textDocument/definition"] = require("plugin.config.lsp.handlers.definition").goto_definition("vs"),
    ["textDocument/references"] = lsp.with(lsp.handlers["textDocument/references"], { loclist = true }),
    ["textDocument/formatting"] = require("plugin.config.lsp.handlers.format").format,
  }
end

function M.capabilities(client_name)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.semanticHighlighting = true
  capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = { 1 },
  }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown",
    "plaintext",
  }

  if client_name == "clangd" then
    capabilities.offsetEncoding = "utf-8"
  end

  return capabilities
end

function M.flags()
  return {
    debounce_text_changes = 150,
  }
end

-- @param buffer number
-- @todo
function M.buf_autocmd_codelens(buffer) end

-- Finds and runs the closest codelens (searches upwards only)
function M.find_and_run_codelens()
  local bufnr = api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lenses = lsp.codelens.get(bufnr)

  lenses = vim.tbl_filter(function(lense)
    return lense.range.start.line < row
  end, lenses)

  if #lenses == 0 then
    return nv.notify("Could not find codelens to run.")
  end

  table.sort(lenses, function(a, b)
    return a.range.start.line > b.range.start.line
  end)

  api.nvim_win_set_cursor(0, {
    lenses[1].range.start.line + 1,
    0,
  })
  lsp.codelens.run()
  api.nvim_win_set_cursor(0, { row, col }) -- restore cursor, TODO: also restore position
end

return M

-- vim:ft=lua
