--- Utility functions for loading plugins, adding plugin specifications
--- to packer, etc.
-- @module utils.loaders

local M = {}

--- Replaces native vim.popup with a telescope UI.
-- @see help vim.popup
-- @see plugin https://is.gd/Zt9qlo
function M.load_ui_select()
  if not packer_plugins then
    return
  end
  if not packer_plugins["telescope-ui-select.nvim"].loaded then
    require "telescope"
  end
end

--- Loads a specific plugin module for packer.
--- A plugin module shall contain sets of plugins that falls under a
--- specific category eg: bufferline.nvim and lualine.nvim fall under
--- category of UI. So, the recommended way to add those plugin specs
--- is to define them in a file called plugins.ui
-- @param pacman the package manager object
-- @param module the module path (in Lua)
function M.load_module(pacman, module)
  for _, plugin in ipairs(module) do
    pacman.use(plugin)
  end
end

return M

-- vim:ft=lua
