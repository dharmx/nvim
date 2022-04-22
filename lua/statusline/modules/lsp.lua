local M = {}

local config = require("statusline.config").lsp
local util = require "utils.statusline"

function M.lsp()
  local Lsp = lsp.util.get_progress_messages()[1]
  local label = string.format("%%#StatusLineLSPReverse#%s%%#StatusLineLSP#%s", config.style.right, config.label)
  if Lsp then
    local msg = Lsp.message or ""
    local percentage = Lsp.percentage or 0
    local title = Lsp.title or ""
    local spinners = config.spinners.loading

    local success_icon = config.spinners.success

    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners

    if percentage >= 70 then
      return string.format(
        "%s %%#StatusLineLSPDark#%%<%s %s %s (%s%%%%) %%#StatusLineLSPExtra#",
        label,
        success_icon[frame + 1],
        title,
        msg,
        percentage
      )
    end

    return string.format(
      "%s %%#StatusLineLSPDark#%%<%s %s %s (%s%%%%) %%#StatusLineLSPExtra#",
      label,
      spinners[frame + 1],
      title,
      msg,
      percentage
    )
  end

  local clients = lsp.get_active_clients()
  if clients[1] then
    if config.short then
      return string.format(
        "%s %%#StatusLineLSPDone#%s %%#StatusLineLSPClients#%s %%#StatusLineLSPExtra#",
        label,
        config.server_label,
        #clients
      )
    end
    return string.format("%s: %s", label, table.concat(vim.tbl_map(util.get_client_name, clients), ", "))
  end
  return "%#StatusLineLSPExtraExtra#"
end

return M

-- vim:ft=lua
