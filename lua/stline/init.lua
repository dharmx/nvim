--- Statusline main file

local hidden = require("tables.blacklisted").hidden -- load all filetypes where stl would be hidden
local util = require("utils.stline") -- load statusline specific utility function
local config = require("stline.config") -- load the config file for the statusline

local api = vim.api
local nv = require("utils.neovim")

local modules = {} -- enabled modules
modules["mode"] = require("stline.modules.mode")["mode"] -- displays vim-mode
modules["dirname"] = require("stline.modules.dirname")["dirname"] -- displays cwd name
modules["filename"] = require("stline.modules.filename")["filename"] -- displays current filename
modules["treesitter"] = require("stline.modules.treesitter")["treesitter"] -- ts contexts (document symbol)
modules["diagnostics"] = require("stline.modules.diagnostics")["diagnostics"] -- lsp diagnostics
modules["lightbulb"] = require("stline.modules.lightbulb")["lightbulb"] -- indicator for code actions
modules["lsp"] = require("stline.modules.lsp")["lsp"] -- lsp status
modules["git"] = require("stline.modules.git")["git"] -- git related info
modules["position"] = require("stline.modules.position")["position"] -- position of the cursor in the file

--- Truncator function.
-- If the size of the statusline component is greater than
-- configured window length then return an empty string, return the component string otherwise
-- @param module the component string
-- @see other component specific values are passed on by the ellipsis.
local function truncated(module, ...)
  if api.nvim_win_get_width(0) < config[module].truncate then
    return ""
  end
  return modules[module](...)
end

--- Main statusline function
-- @param state there are 5 states
-- active: the normal state of the statusline
-- inactive: the state of the statusline when filetype is within @{hidden}
-- small: this happens automatically.. when the window size is abnormally small
-- default: also happens automatically when none of the conditions apply
function _G.stl(state)
  local mode = api.nvim_get_mode().mode
  local width = api.nvim_win_get_width(0)
  util.set_colors(mode)
  local combined = "%#StatusLineInactive#%=" .. truncated("mode", true) .. "%="

  if width < 17 then
    return combined .. modules.mode(true) .. "%="
  end

  -- NOTE: all of these modules is passed through the truncator in order to make the size dynamic
  if state == "active" then
    local left = table.concat({
      truncated("mode"),
      truncated("dirname"),
      truncated("filename"),
      truncated("treesitter"),
      "%#StatusLineBG#",
    })
    local right = table.concat({
      "%=",
      truncated("diagnostics"),
      truncated("lightbulb") .. truncated("lsp"),
      truncated("git"),
      truncated("position"),
    })
    combined = left .. right
  elseif state == "inactive" then
    combined = "%#StatusLineNC#"
  end
  return config.MAIN.left .. combined .. "%#Default#" .. config.MAIN.right
end

return {
  setup = function()
    -- statusline augroup which makes the statusline persisten throughout buffers
    nv.augroup("StatusLine", {
      {
        events = {
          "WinEnter",
          "BufEnter",
          "FileType",
        },
        command = "setlocal statusline=%!v:lua.stl()",
        options = {
          patterns = hidden,
          desc = "Show the small statusline on specific filetypes",
        },
      },
      {
        events = {
          "WinEnter",
          "BufEnter",
        },
        command = "setlocal statusline=%!v:lua.stl('active')",
        options = {
          desc = "Show the active statusline on BufEnter and WinEnter",
        },
      },
      {
        events = {
          "WinLeave",
          "BufLeave",
        },
        command = "setlocal statusline=%!v:lua.stl('inactive')",
        options = {
          desc = "Hide the statusline on leaving the current window, i.e. moving onto a floating window for instance",
        },
      },
    })
  end,
  styles = {
    angled = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    flame = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    rounded = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    slant = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    square = {
      left = "█",
      right = "█",
      left_alt = "",
      right_alt = "",
    },
    xsquare = {
      left = "█",
      right = "█",
      left_alt = "█",
      right_alt = "█",
    },
    pacman = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    graphy = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    slantv1 = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    slantv2 = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    slantv3 = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    pixel = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
    fullslant = {
      left = "",
      right = "",
      left_alt = "",
      right_alt = "",
    },
  },
}

-- vim:ft=lua
