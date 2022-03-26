local M = {}

local config = require("statusline.config").dirname

function M.dirname()
  local path = fn.fnamemodify(fn.getcwd(), ":t")
  return string.format(
    "%%#StatusLineDirname#%s%s%%#StatusLineDirnameReverse#%s%%#Default#",
    config.icon,
    path,
    config.style.left
  )
end

return M

-- vim:ft=lua
