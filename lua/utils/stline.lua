--- Utility functions used by the statusline.

local M = {}

local b = vim.b
local theming = require("utils.theming")
local hi = theming.highlight

--- Shortens path by turning apple/orange -> a/orange
-- @param path string
-- @param sep string path separator
-- @return string of shortened path
-- @see Adapted from https://is.gd/1seR8N
function M.shorten_path(path, sep)
  return path:gsub(string.format("([^%s])[^%s]+%%%s", sep, sep, sep), "%1" .. sep, 1)
end

--- Filter function for diagnostics severity. If say there are 0 hints
--- then it would be truncated. Turns 0 Hints 0 Warns 2 Errors -> 2 Errors.
-- @param diag number the severity category.
-- @return boolean true if the category is 0, false otherwise.
function M.zero_diag_filter(diagnostics)
  return diagnostics ~= 0
end

function M.set_stl_float(float)
  local colors = require("utils.theming").get_active_theme()
  if not float then
    hi("StatusLineScopesReverse", {
      fg = colors.shades.shade06,
      bg = colors.shades.shade06,
    })
    hi("StatusLineBG", {
      bg = colors.shades.shade06,
      fg = colors.shades.shade06,
    })
    hi("StatusLineScopesON", {
      bg = colors.shades.shade06,
      fg = colors.common.base14,
      bold = true,
    })
    hi("StatusLineScopesOFF", {
      bg = colors.shades.shade06,
      fg = colors.common.base11,
      bold = true,
    })
    hi("StatusLineError", {
      bg = colors.shades.shade06,
      fg = colors.common.base11,
    })
    hi("StatusLineWarn", {
      bg = colors.shades.shade06,
      fg = colors.common.base12,
    })
    hi("StatusLineHint", {
      bg = colors.shades.shade06,
      fg = colors.common.base09,
    })
    hi("StatusLineInfo", {
      bg = colors.shades.shade06,
      fg = colors.common.base13,
    })
    return
  end
  hi("StatusLineError", {
    bg = colors.common.base00,
    fg = colors.common.base11,
  })
  hi("StatusLineWarn", {
    bg = colors.common.base00,
    fg = colors.common.base12,
  })
  hi("StatusLineHint", {
    bg = colors.common.base00,
    fg = colors.common.base09,
  })
  hi("StatusLineInfo", {
    bg = colors.common.base00,
    fg = colors.common.base13,
  })
  hi("StatusLineBG", {
    bg = colors.common.base00,
    fg = colors.common.base00,
  })
  hi("StatusLineScopesReverse", {
    fg = colors.common.base00,
    bg = colors.common.base00,
  })
  hi("StatusLineScopesON", {
    bg = colors.common.base00,
    fg = colors.common.base14,
    bold = true,
  })
  hi("StatusLineScopesOFF", {
    bg = colors.common.base00,
    fg = colors.common.base11,
    bold = true,
  })
end

--- Highlights and re-highlights dynamic colors
--- based on modes for the statusline.
-- @param current string mode string
-- @see help modes
function M.set_colors(current)
  local colors = theming.get_active_theme()
  hi("StatusLineFilename", {
    fg = colors.modes[current],
    bg = colors.common.base01,
  })
  hi("StatusLineFilenameReverse", {
    fg = colors.common.base01,
    bg = colors.modes[current],
  })
  hi("StatusLineFilenameReverseExtra", {
    fg = colors.modes[current],
  })
  hi("StatusLineMode", {
    bg = colors.modes[current],
    fg = colors.common.base02,
    bold = true,
  })
  hi("StatusLineModeReverse", {
    bg = colors.common.base15,
    fg = colors.modes[current],
  })
  hi("StatusLineInactive", {
    bg = colors.common.base00,
    fg = colors.modes[current],
  })
  hi("StatusLineFilenameExtraExtraRight", {
    bg = colors.modes[current],
    fg = colors.common.base01,
  })
  hi("StatusLinePosition", {
    fg = colors.common.base01,
    bg = colors.modes[current],
    bold = true,
  })
  hi("StatusLinePositionLast", {
    fg = colors.common.base15,
    bg = colors.modes[current],
    bold = true,
  })
  hi("StatusLinePositionReverse", {
    fg = colors.modes[current],
    bg = colors.common.base03,
  })
  hi("StatusLineFilenameExtraExtraRight", {
    bg = colors.modes[current],
    fg = colors.common.base01,
  })
  hi("StatusLineLSP", {
    fg = colors.modes[current],
    bg = colors.common.base01,
    bold = true,
  })
  hi("BufferLineTabClose", {
    fg = colors.common.base01,
    bg = colors.modes[current],
  })
end

-- @section Git utilities section
-- @see Adapted from https://is.gd/actuDB

--- Uses gitsigns.nvim to get the git branch name.
-- @return string name of the git branch
function M.git_branch()
  return b.gitsigns_head or ""
end

--- Counts the changes made.
-- @param type string type of change eg: removed, added, etc.
-- @return string number of changes
function M.git_diff(type)
  local gsd = b.gitsigns_status_dict

  if gsd and gsd[type] and gsd[type] > 0 then
    return tostring(gsd[type])
  end

  return ""
end

--- Counts the chars/lines added to the file.
-- @return string number of chars/lines added
function M.git_diff_added()
  return M.git_diff("added")
end

--- Counts the chars/lines removed from the file.
-- @return string number of chars/lines removed
function M.git_diff_removed()
  return M.git_diff("removed")
end

--- Counts the chars/lines changed from the file.
-- @return string number of chars/lines changed
function M.git_diff_changed()
  return M.git_diff("changed")
end

--- Utility function to check if git provider information is available
-- @return string branch name if the repo is new.
-- @treturn diff info if the repo not new.
function M.git_info_exists()
  return b.gitsigns_head or b.gitsigns_status_dict
end

--- Use as callback in LSP statusline module. Returns the name of the
--- client.
-- @treturn client configuration table.
function M.get_client_name(client)
  return client.name
end

return M

-- vim:ft=lua
