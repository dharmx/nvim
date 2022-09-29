--- GIT related STL module
local M = {}

local lsp = vim.lsp

local config = require("stline.config").git -- load git specific STL config
-- @see configs.editing.gitsigns for more git related configs
-- NOTE: the module-specific utilities may migrated to their respective modules in the near future
local util = require("utils.stline") -- load statusline specific utilities

--- Driver function for fetching the GIT info for the current buffer (if it's a git repo)
-- WANTS: depends on the plugin gitsigns.nvim
-- INFO: also nothing will be displayed until it is loaded (specific to those who lazy-load this plugin)
function M.git()
  local clients = config.buf_local_clients and lsp.buf_get_clients(0) or lsp.get_active_clients()
  local bran = util.git_branch()
  local chan = util.git_diff_changed()
  local rmv = util.git_diff_removed()
  local add = util.git_diff_added()

  -- treat the old default branch naming the same as that of main
  if bran == "main" or bran == "master" then
    bran_icon = config.main
  end

  return string.format(
    "%s%s%%#StatusLineGit#%%#StatusLineGitBranch#%s%%#StatusLineGitAdd#%s%%#StatusLineGitChange#%s%%#StatusLineGitDelete#%s",
    #clients == 0 and "%#StatusLineGitExtraExtra#" or "%#StatusLineGitExtra#",
    config.style.right,
    -- display empty string if no change/addition/deletion has occured
    bran == "" and "" or config.branch .. bran,
    add == "" and "" or config.added .. add,
    chan == "" and "" or config.changed .. chan,
    rmv == "" and "" or config.removed .. rmv
  )
end

return M

-- vim:ft=lua
