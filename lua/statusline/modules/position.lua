local M = {}

local config = require("statusline.config").position

function M.position()
  local current_line = fn.line "."
  local total_lines = fn.line "$"
  local chars = config.spinners
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  local position = math.ceil(line_ratio * 100)
  if position <= 10 then
    position = config.top
  elseif position >= 90 then
    position = config.bottom
  elseif config.icon then
    position = chars[index] .. position .. "%%"
  end
  local loaded = _G.packer_plugins and _G.packer_plugins["gitsigns.nvim"].loaded
  local transition = {
    foreground = colors.common.base03,
    decoration = "bold",
  }
  if loaded then
    transition.background = loaded and colors.common.base02 or colors.shades.shade06
  elseif #lsp.get_active_clients() ~= 0 then
    transition.background = colors.common.base01
  else
    transition.background = colors.shades.shade06
  end
  hi("StatusLinePositionFirst", transition)
  return string.format(
    "%s%%#StatusLinePositionFirst#%s%%#StatusLinePositionReverse#%s%%#StatusLinePosition# %s%%#StatusLinePositionLast# %s%%#StatusLinePositionLastExtra#%s%%#Default#",
    loaded and "" or "",
    config.style.right,
    config.style.right,
    position,
    config.style.right,
    config.extra
  )
end

return M

-- vim:ft=lua
