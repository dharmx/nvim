local M = {}

local config = require("statusline.config").git
local util = require "utils.statusline"

function M.git()
  local bran, bran_icon = util.git_branch()

  if bran == "" then
    return ""
  end

  local chan, chan_icon = util.git_diff_changed()
  local rmv, rmv_icon = util.git_diff_removed()
  local add, add_icon = util.git_diff_added()

  if bran == "main" or bran == "master" then
    bran_icon = " "
  end

  return string.format(
    "%s%s%%#StatusLineGit#%%#StatusLineGitBranch#%s%%#StatusLineGitAdd#%s%%#StatusLineGitChange#%s%%#StatusLineGitDelete#%s",
    #lsp.get_active_clients() == 0 and "%#StatusLineGitExtraExtra#" or "%#StatusLineGitExtra#",
    config.style.right,
    bran == "" and "" or bran_icon .. bran,
    add == "" and "" or add_icon .. add,
    chan == "" and "" or chan_icon .. chan,
    rmv == "" and "" or rmv_icon .. rmv
  )
end

return M

-- vim:ft=lua
