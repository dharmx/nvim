--- STL current working directory name
local M = {}

local fn = vim.fn

local config = require("stline.config").dirname -- load dirname specific config

--- Driver function for displaying the current working directory in the STL
function M.dirname()
  -- shortens the path based of a format string
  -- @see :help filename-modifiers
  local path = fn.fnamemodify(fn.getcwd(), config.format)
  return string.format("%%#StatusLineDirname#%s%s%%#StatusLineDirnameReverse#%s", config.icon, path, config.style.left)
end

return M

-- vim:ft=lua
