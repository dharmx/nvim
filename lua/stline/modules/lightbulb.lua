--- LSP code actions STL module
local M = {}

local lsp = vim.lsp

local config = require("stline.config").lightbulb -- load lightbulb specific config
-- @see configs.lsp.lightbulb for more customisation options

--- Driver function for displaying code-actions indicator
-- WANTS: depends on nvim-lightbulb
function M.lightbulb()
  -- either display clients attached to the current buffer or, all active clients
  local clients = config.buf_local_clients and lsp.buf_get_clients(0) or lsp.get_active_clients()
  if #clients ~= 0 then
    local present, lightbulb = pcall(require, "nvim-lightbulb")
    -- put empty string if lightbulb hasn't loaded and if there is no code actions in the current lsp client
    local status = present and lightbulb.get_status_text() or ""
    if status == "" then
      return string.format(
        "%%#StatusLineLSPReverse#%s%%#StatusLineBulbLOAD#%s%%#StatusLineLSPExtra#",
        config.style.right,
        config.loading
      )
    end

    -- if there is no code actions in the current line then show a different indicator
    if status == "None" then
      return string.format(
        "%%#StatusLineLSPReverse#%s%%#StatusLineBulbOFF#%s%%#StatusLineLSPExtra#",
        config.style.right,
        config.unavailable
      )
    end
    return string.format(
      "%%#StatusLineLSPReverse#%s%%#StatusLineBulbON#%s%%#StatusLineLSPExtra#",
      config.style.right,
      config.active
    )
  end
  return "%#StatusLineLSPExtraExtra#"
end

return M

-- vim:ft=lua
