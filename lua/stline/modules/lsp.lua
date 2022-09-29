--- General LSP STL module
local M = {}

local lsp = vim.lsp

local config = require("stline.config").lsp -- load LSP specific config
local util = require("utils.stline") -- load LSP specific utilities

--- Driver function for displaying LSP info in the STL
-- can display number of globally active lsp clients
-- can display number of active clients in the current buffer
-- can display their names as well
-- @see help get_progress_messages
-- @see help get_active_clients
-- @see help buf_get_clients
function M.lsp()
  local Lsp = lsp.util.get_progress_messages()[1]
  local label = string.format("%%#StatusLineLSPReverse#%s%%#StatusLineLSP#%s", config.style.right, config.label)
  -- NOTE: This part is entered when workspaces/libaries are loaded by the LSP client
  if Lsp then
    local msg = Lsp.message or ""
    local percentage = Lsp.percentage or 0
    local title = Lsp.title or ""
    local spinners = config.spinners.loading

    local success_icon = config.spinners.success

    -- spinners when the LSP state is indeterminate
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners

    -- NOTE: This part is entered when the LSP client has almost completed loading said libaries/workspaces
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

  local clients = config.buf_local_clients and lsp.buf_get_clients(0) or lsp.get_active_clients()
  if #clients ~= 0 then
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
