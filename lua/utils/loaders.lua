local M = {}

function M.load_ui_select()
  if not _G.packer_plugins["telescope-ui-select.nvim"].loaded then
    require "telescope"
  end
end

function M.load_module(pacman, module)
  for _, plugin in ipairs(module) do
    pacman.use(plugin)
  end
end

function M.load_all(pacman, plugins)
  for _, plugin in ipairs(plugins) do
    pacman.use(plugin)
  end
end

return M

-- vim:ft=lua
