local hidden = require("tables.blacklisted").hidden
local set_colors = require("utils.statusline").set_colors
local config = require "statusline.config"
local modules = {}

for _, module in
  pairs {
    "mode",
    "dirname",
    "filename",
    "treesitter",
    "diagnostics",
    "lightbulb",
    "lsp",
    "git",
    "position",
  }
do
  modules[module] = require("statusline.modules." .. module)[module]
end

local function truncated(module, ...)
  if api.nvim_win_get_width(0) < config[module].truncate then
    return ""
  end
  return modules[module](...)
end

StatusLine = function(state)
  local mode = api.nvim_get_mode().mode
  local width = api.nvim_win_get_width(0)
  set_colors(mode)
  local combined = "%#StatusLineInactive#%=" .. truncated("mode", true) .. "%="

  if width < 17 then
    return combined .. modules.mode(true) .. "%="
  end

  if state == "active" then
    local left = table.concat {
      truncated "mode",
      truncated "dirname",
      truncated "filename",
      truncated "treesitter",
      "%#Statusline#",
    }
    local right = table.concat {
      "%=",
      truncated "diagnostics",
      truncated "lightbulb" .. truncated "lsp",
      truncated "git",
      truncated "position",
    }
    combined = left .. right
  elseif state == "inactive" then
    combined = "%#StatuslineNC#"
  end
  return combined
end

augroup("StatusLine", {
  {
    events = { "WinEnter", "BufEnter", "FileType" },
    command = "setlocal statusline=%!v:lua.StatusLine()",
    options = {
      patterns = hidden,
    },
  },
  {
    events = { "WinEnter", "BufEnter" },
    command = "setlocal statusline=%!v:lua.StatusLine('active')",
  },
  {
    events = { "WinLeave", "BufLeave" },
    command = "setlocal statusline=%!v:lua.StatusLine('inactive')",
  },
})

-- vim:ft=lua
