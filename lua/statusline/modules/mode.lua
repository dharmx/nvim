local M = {}

local config = require("statusline.config").mode

function M.mode()
  local current = api.nvim_get_mode().mode
  return string.format(
    "%%#StatusLineMode# %s %%#StatusLineModeReverse#%s%%#StatusLineFilenameExtra#%s%%#Default#",
    config.modes[current][config.label],
    config.style.right_alt,
    config.style.right_alt
  )
end

return M

-- vim:ft=lua
