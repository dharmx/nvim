local M = {}

local config = require("statusline.config").diagnostics
local get = diagnostic.get
local clients = lsp.get_active_clients

function M.diagnostics()
  local diags = {
    ERROR = #get(0, { severity = diagnostic.severity.ERROR }),
    WARN = #get(0, { severity = diagnostic.severity.WARN }),
    INFO = #get(0, { severity = diagnostic.severity.INFO }),
    HINT = #get(0, { severity = diagnostic.severity.HINT }),
  }

  local icons = config.severities
  local colors = {
    ERROR = "%#StatusLineError#",
    WARN = "%#StatusLineWarn#",
    INFO = "%#StatusLineInfo#",
    HINT = "%#StatusLineHint#",
  }
  local results = {}
  for sev, num in pairs(diags) do
    if num ~= 0 then
      table.insert(results, colors[sev] .. icons[sev] .. " " .. diags[sev])
    end
  end
  return #clients() == 0 and "" or string.format(" %s ", table.concat(results, " "))
end

return M

-- vim:ft=lua
