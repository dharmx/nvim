local hidden = require("tables.blacklisted").hidden
local set_colors = require("utils.statusline").set_colors

local modules = {}
for _, module in
  pairs {
    "mode",
    "dirname",
    "filename",
    "treesitter",
    "diagnostics",
    "lsp",
    "git",
    "position",
  }
do
  modules[module] = require("statusline.modules." .. module)[module]
end

StatusLine = function(state)
  set_colors(api.nvim_get_mode().mode)
  local combined = "%#StatusLineInactive#%=" .. modules.filename(true) .. "%="
  if state == "active" then
    local left = table.concat {
      modules.mode(),
      modules.dirname(),
      modules.filename(),
      modules.treesitter(),
    }
    local right = table.concat {
      "%=",
      modules.diagnostics(),
      modules.lsp(),
      modules.git(),
      modules.position(),
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
