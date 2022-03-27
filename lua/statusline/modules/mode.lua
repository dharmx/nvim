local M = {}

local config = require("statusline.config").mode

function M.mode(short)
  local current = api.nvim_get_mode().mode
  if short then
    return string.format("%%#StatusLineMode# %s %%#Default#", config.modes[current][3])
  end
  return string.format(
    "%%#StatusLineMode# %s %%#StatusLineModeReverse#%s%%#StatusLineFilenameExtra#%s",
    config.modes[current][config.label],
    config.style.right_alt,
    config.style.right_alt
  )
end

return M

-- vim:ft=lua
