local M = {}

local config = require("statusline.config").git
local util = require "utils.statusline"

function M.git()
  local bran = util.git_branch()

  if bran == "" then
    return ""
  end

  local chan = util.git_diff_changed()
  local rmv = util.git_diff_removed()
  local add = util.git_diff_added()

  if bran == "main" or bran == "master" then
    bran_icon = config.main
  end

  return string.format(
    "%s%s%%#StatusLineGit#%%#StatusLineGitBranch#%s%%#StatusLineGitAdd#%s%%#StatusLineGitChange#%s%%#StatusLineGitDelete#%s",
    #lsp.get_active_clients() == 0 and "%#StatusLineGitExtraExtra#" or "%#StatusLineGitExtra#",
    config.style.right,
    bran == "" and "" or config.branch .. bran,
    add == "" and "" or config.added .. add,
    chan == "" and "" or config.changed .. chan,
    rmv == "" and "" or config.removed .. rmv
  )
end

return M

-- vim:ft=lua
