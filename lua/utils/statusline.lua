--- Utility functions used by the statusline.
-- @module utils.statusline
-- @alias M

local M = {}

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
function M.zero_diag_filter(diag)
  return diag ~= 0
end

--- Highlights and re-highlights dynamic colors
--- based on modes for the statusline.
-- @param current string mode string
-- @see help modes
function M.set_colors(current)
  schedule(function()
    hi("StatusLineFilename", {
      guifg = colors.modes[current],
      guibg = colors.common.base01,
    })
    hi("StatusLineFilenameReverse", {
      guifg = colors.common.base01,
      guibg = colors.modes[current],
    })
    hi("StatusLineFilenameReverseExtra", {
      guifg = colors.modes[current],
    })
    hi("StatusLineMode", {
      guibg = colors.modes[current],
      guifg = colors.common.base02,
      gui = "bold",
    })
    hi("StatusLineModeReverse", {
      guibg = colors.common.base15,
      guifg = colors.modes[current],
    })
    hi("StatusLineInactive", {
      guibg = colors.common.base00,
      guifg = colors.modes[current],
    })
    hi("StatusLineFilenameExtraExtraRight", {
      guibg = colors.modes[current],
      guifg = colors.common.base01,
    })
    hi("StatusLinePosition", {
      guifg = colors.common.base01,
      guibg = colors.modes[current],
      gui = "bold",
    })
    hi("StatusLinePositionLast", {
      guifg = colors.common.base15,
      guibg = colors.modes[current],
      gui = "bold",
    })
    hi("StatusLinePositionReverse", {
      guifg = colors.modes[current],
      guibg = colors.common.base03,
    })
    hi("StatusLineFilenameExtraExtraRight", {
      guibg = colors.modes[current],
      guifg = colors.common.base01,
    })
    hi("StatusLineLSP", {
      guifg = colors.modes[current],
      guibg = colors.common.base01,
      gui = "bold",
    })
    hi("BufferLineTabClose", {
      guifg = colors.common.base01,
      guibg = colors.modes[current],
    })
  end)
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
  return M.git_diff "added"
end

--- Counts the chars/lines removed from the file.
-- @return string number of chars/lines removed
function M.git_diff_removed()
  return M.git_diff "removed"
end

--- Counts the chars/lines changed from the file.
-- @return string number of chars/lines changed
function M.git_diff_changed()
  return M.git_diff "changed"
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
