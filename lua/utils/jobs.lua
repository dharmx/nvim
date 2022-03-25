-- Plenary wrappers.
-- @module utils.jobs

local M = {}

-- Execute commands using the plenary async API
-- @see Adapted from https://git.io/JK3ht
-- @param cwd the current working directory
-- @param cm the command
function M.get_os_command_output(cm, cwd)
  local Job = require "plenary.job"
  if type(cm) ~= "table" then
    vim.notify "Utils: [get_os_command_output]: cmd has to be a table"
    return {}
  end
  local command = table.remove(cm, 1)
  local stderr = {}
  local stdout, ret = Job
    :new({
      command = command,
      args = cm,
      cwd = cwd,
      on_stderr = function(_, data)
        table.insert(stderr, data)
      end,
    })
    :sync()
  return stdout, ret, stderr
end

return M

-- vim:ft=lua
