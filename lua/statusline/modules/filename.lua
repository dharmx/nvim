local M = {}

local config = require("statusline.config").filename

function M.filename(disabled)
  local path = fn.expand "%:~"
  local modified = not bo.modified and "" or config.modified
  local readonly = not bo.readonly and "" or config.readonly
  local modifiable = bo.modifiable and "" or config.modifiable

  if config.format then
    path = fn.expand(config.format)
  elseif not config.absolute then
    path = fn.expand "%:t"
  end

  local format = string.format(
    "%%#StatusLineFilename#%s%s%s%s%%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s%%#Default#",
    path,
    modified,
    readonly,
    modifiable,
    config.style.left,
    config.style.left
  )

  if config.icon then
    local present, devicons = pcall(require, "nvim-web-devicons")
    local icon = config.default
    if present then
      icon = " " .. devicons.get_icon(fn.expand "%:t", fn.expand "%:e", { default = true })
    end

    if disabled then
      format = string.format(
        "%s%%#StatusLineFilenameExtraExtraRight#%s%%#StatusLineFilenameExtraRight#%s%%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s%%#Default#",
        config.style.right,
        config.style.right,
        icon,
        config.style.left,
        config.style.left
      )
    else
      format = string.format(
        "%%#StatusLineFilename#%s %s%s%s%s%%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s%%#Default#",
        icon,
        path,
        modified,
        readonly,
        modifiable,
        config.style.left,
        config.style.left
      )
    end
  end
  return format
end

return M

-- vim:ft=lua
