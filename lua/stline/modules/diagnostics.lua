--- STL LSP diagnostics module.
local M = {}

local lsp = vim.lsp
local diag = vim.diagnostic

local config = require("stline.config").diagnostics -- load diag related config

--- Driver function for fetching the diagnostics module string
-- @see help lsp.diagnostic
-- @see help vim.diagnostic
function M.diagnostics()
  local clients = config.buf_local_clients and lsp.buf_get_clients(0) or lsp.get_active_clients()
  local diags = {
    -- @{diag.get} fetches the current dignostics
    -- @see :help diagnostic.get
    -- @see :help diagnostic.severity
    ERROR = #diag.get(0, {
      severity = diag.severity.ERROR,
    }),
    WARN = #diag.get(0, {
      severity = diag.severity.WARN,
    }),
    INFO = #diag.get(0, {
      severity = diag.severity.INFO,
    }),
    HINT = #diag.get(0, {
      severity = diag.severity.HINT,
    }),
  }

  local icons = config.severities
  local colors = {
    ERROR = "%#StatusLineError#",
    WARN = "%#StatusLineWarn#",
    INFO = "%#StatusLineInfo#",
    HINT = "%#StatusLineHint#",
  }
  -- concat icons with the diagnostic value
  local results = {}
  for sev, num in pairs(diags) do
    if num ~= 0 then
      table.insert(results, colors[sev] .. icons[sev] .. " " .. diags[sev])
    end
  end
  -- returns empty string if there aren't any attached clients
  return #clients == 0 and "" or string.format(" %s ", table.concat(results, " "))
end

return M

-- vim:ft=lua
