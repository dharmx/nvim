--- Mode indicator STL module
local M = {}

local api = vim.api

local config = require("stline.config").mode -- load all mode specific config

--- Driver function for displaying the current mode.
function M.mode(short)
  -- fetch the current mode string
  -- @see nvim_get_mode
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
