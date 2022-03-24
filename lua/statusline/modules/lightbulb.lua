local M = {}

local config = require("statusline.config").lightbulb

function M.lightbulb()
  local Lsp = lsp.util.get_progress_messages()[1]
  local clients = lsp.get_active_clients()
  if clients[1] then
    local present, lightbulb = pcall(require, "nvim-lightbulb")
    local status = present and lightbulb.get_status_text() or ""

    if status == "" then
      return string.format(
        "%%#StatusLineLSPReverse#%s%%#StatusLineBulbLOAD#  %%#StatusLineLSPExtra#",
        config.style.right
      )
    end

    if status == "None" then
      return string.format(
        "%%#StatusLineLSPReverse#%s%%#StatusLineBulbOFF#  %%#StatusLineLSPExtra#",
        config.style.right
      )
    end

    return string.format(
      "%%#StatusLineLSPReverse#%s%%#StatusLineBulbON#  %%#StatusLineLSPExtra#",
      config.style.right
    )
  end
  return "%#StatusLineLSPExtraExtra#"
end

return M

-- vim:ft=lua
