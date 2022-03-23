local M = {}

local config = require("statusline.config").treesitter

function M.treesitter()
  local fallback = "%%#StatusLineScopesOFF#%s%%#StatusLineScopes#%%#StatusLineScopesReverse#%s%%#Statusline#"
  local available = "%%#StatusLineScopesON#%s%%#StatusLineScopes#%s%%#StatusLineScopesReverse#%s%%#Statusline#"
  if packer_plugins and packer_plugins["nvim-gps"].loaded then
    local scopes = require "nvim-gps"
    return scopes.is_available()
        and string.format(available, config.enabled_icon, scopes.get_location(), config.style.left)
      or string.format(fallback, config.disabled_icon, config.style.left)
  end
  return "%#Statusline#"
end

return M

-- vim:ft=lua
