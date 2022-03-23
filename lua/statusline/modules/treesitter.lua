local M = {}

local config = require("statusline.config").treesitter

function M.treesitter()
  local format = "%#Statusline#"
  local parser_location = stdpath "data"
    .. string.format("/site/pack/packer/opt/nvim-treesitter/parser/%s.so", bo.filetype)

  if not exists(parser_location) then
    return format
  end

  if _G.packer_plugins and _G.packer_plugins["nvim-gps"].loaded then
    local scopes = require "nvim-gps"
    local fallback = string.format(
      "%%#StatusLineScopesOFF#%s%%#StatusLineScopes#%%#StatusLineScopesReverse#%s%%#Statusline#",
      config.disabled_icon,
      config.style.left
    )

    local location = string.format(
      "%%#StatusLineScopesON#%s%%#StatusLineScopes#%s%%#StatusLineScopesReverse#%s%%#Statusline#",
      config.enabled_icon,
      scopes.get_location(),
      config.style.left
    )

    format = scopes.is_available() and location or fallback
  end

  return format
end

return M

-- vim:ft=lua
