--- STL current filename module
local M = {}

local bo = vim.bo
local fn = vim.fn

local config = require("stline.config").filename -- load filename specific config

--- Driver function for fetching the file name module
-- has readonly, modifiable and modified specifiers as well
-- @see help bo.modifiable
-- @see help bo.readonly
-- @see help bo.modifiable
-- @param disabled if set ot true then this will return a disabled version of this module
function M.filename()
  -- format in which the filename would be viewed, change it to a different format if you
  -- want to display the absolute path
  -- @see help expand
  local path = fn.expand(config.format or config.absolute and "%:~" or "%:t")
  local modified = not bo.modified and "" or config.modified -- notice if the buffer has been edited
  local readonly = not bo.readonly and "" or config.readonly -- notice if the buffer needs escalation or is writable at all
  local modifiable = bo.modifiable and "" or config.modifiable -- notice if the off-buffer can be changed

  local format = string.format(
    "%%#StatusLineFilename#%s%s%s%s%%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s",
    path,
    modified,
    readonly,
    modifiable,
    config.style.left,
    config.style.left
  )

  if config.icon then
    -- WANTS: this part depends on the nvim-web-devicons plugin
    local present, devicons = pcall(require, "nvim-web-devicons")
    local icon = ""
    if present then
      icon = " " .. devicons.get_icon(fn.expand("%:t"), fn.expand("%:e"), { default = true })
    end

    -- will only display the filetype icon if this option is set
    if config.only_icon then
      format = string.format(
        "%s%%#StatusLineFilenameExtraExtraRight#%s%%#StatusLineFilenameExtraRight#%s %%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s",
        config.style.right,
        config.style.right,
        icon,
        config.style.left,
        config.style.left
      )
    else
      -- if the path of the filename is empty then the filetype will be displayed as 'unnamed'
      if path == "" then
        path = config.unnamed
      end
      format = string.format(
        "%%#StatusLineFilename#%s %s%s%s%s%%#StatusLineFilenameReverse#%s%%#StatusLineFilenameReverseExtra#%s",
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
