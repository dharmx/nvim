local M = {}

local function goto_definition(split_cmd)
  local util = lsp.util
  local log = require("vim.lsp.log").info

  return function(_, result, context)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log() and log(context.method, "No location found")
      return
    end

    if split_cmd then
      cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])
      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        cmd "copen"
        cmd "wincmd p"
      end
    else
      util.jump_to_location(result)
    end
  end
end

local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

M.handlers = {
  ["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = border }),
  ["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "■", spacing = 1 },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  }),
  ["textDocument/definition"] = goto_definition "split",
  ["textDocument/references"] = lsp.with(on_references, { loclist = true }),
}

M.setup = function()
  for handler, config in pairs(M.handlers) do
    lsp.handlers[handler] = config
  end
end

return M

-- vim:ft=lua
