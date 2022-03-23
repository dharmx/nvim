local M = {}

local config = require("statusline.config").position

function M.position()
  local current_line = fn.line "."
  local total_lines = fn.line "$"
  local chars = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  }
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
  return string.format(
    "%s%%#StatusLinePositionFirst#%s%%#StatusLinePositionReverse#%s%%#StatusLinePosition# %s%%#StatusLinePositionLast# %s%%#StatusLinePositionLastExtra# %%#Default#",
    (_G.packer_plugins and _G.packer_plugins["gitsigns.nvim"].loaded) and " " or "",
    config.style.right,
    config.style.right,
    position,
    config.style.right
  )
end

return M

-- vim:ft=lua
