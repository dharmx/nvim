local M = {}

function M.shorten_path(path, sep)
  return path:gsub(string.format("([^%s])[^%s]+%%%s", sep, sep, sep), "%1" .. sep, 1)
end

function M.zero_diag_filter(diag)
  return diag ~= 0
end

function M.set_colors(current)
  hi("StatusLineFilename", {
    foreground = colors.modes[current],
    background = colors.common.base01,
  })
  hi("StatusLineFilenameReverse", {
    foreground = colors.common.base01,
    background = colors.modes[current],
  })
  hi("StatusLineFilenameReverseExtra", {
    foreground = colors.modes[current],
  })
  hi("StatusLineMode", {
    background = colors.modes[current],
    foreground = colors.common.base02,
    decoration = "bold",
  })
  hi("StatusLineModeReverse", {
    background = colors.common.base15,
    foreground = colors.modes[current],
  })
  hi("StatusLineInactive", {
    background = colors.common.base00,
    foreground = colors.modes[current],
  })
  hi("StatusLineFilenameExtraExtraRight", {
    background = colors.modes[current],
    foreground = colors.common.base01,
  })
  hi("StatusLinePosition", {
    foreground = colors.common.base01,
    background = colors.modes[current],
    decoration = "bold",
  })
  hi("StatusLinePositionLast", {
    foreground = colors.common.base15,
    background = colors.modes[current],
    decoration = "bold",
  })
  hi("StatusLinePositionReverse", {
    foreground = colors.modes[current],
    background = colors.common.base03,
  })
  hi("StatusLineFilenameExtraExtraRight", {
    background = colors.modes[current],
    foreground = colors.common.base01,
  })
  hi("StatusLineLSP", {
    foreground = colors.modes[current],
    background = colors.common.base01,
    decoration = "bold",
  })
  hi("BufferLineTabClose", {
    foreground = colors.common.base01,
    background = colors.modes[current],
  })
end

function M.git_branch()
  return b.gitsigns_head or "", "  "
end

-- Common function used by the git providers
local function git_diff(type)
  local gsd = b.gitsigns_status_dict

  if gsd and gsd[type] and gsd[type] > 0 then
    return tostring(gsd[type])
  end

  return ""
end

function M.git_diff_added()
  return git_diff "added", "  "
end

function M.git_diff_removed()
  return git_diff "removed", "  "
end

function M.git_diff_changed()
  return git_diff "changed", "  "
end

-- Utility function to check if git provider information is available
function M.git_info_exists()
  return b.gitsigns_head or b.gitsigns_status_dict
end

function M.get_client_name(client)
  return client.name
end

return M
