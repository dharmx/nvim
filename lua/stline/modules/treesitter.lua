--- Treesitter current context STL module
local M = {}

local config = require("stline.config").treesitter -- load treesitter related config
-- @see configs.treesitter.gps for more customisation options

--- Driver function for displaying the current context / scope name
-- WANTS: depends on nvim-gps
function M.treesitter()
  local fallback = "%%#StatusLineScopesOFF#%s%%#StatusLineScopes#%%#StatusLineScopesReverse#%s"
  local available = "%%#StatusLineScopesON#%s%%#StatusLineScopes#%s%%#StatusLineScopesReverse#%s"
  if packer_plugins and packer_plugins["nvim-gps"].loaded then -- if not loaded then display a fallback string
    local scopes = require("nvim-gps")
    return scopes.is_available() -- checks if the treesitter parser supports getting the current context
        and string.format(available, config.enabled_icon, scopes.get_location(), config.style.left)
      or string.format(fallback, config.disabled_icon, config.style.left)
  end
  return ""
end

return M

-- vim:ft=lua
