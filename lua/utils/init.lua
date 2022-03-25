-- Utilities for debugging and convenience.
-- @module utils

local M = {}

-- Exactly as it sounds. Takes in a table and returns a sub-table.
-- @param items the table
-- @param upto the ending range
function M.subtable(items, upto)
  local box = {}
  local keys = vim.tbl_keys(items)
  local values = vim.tbl_values(items)
  local count = 1
  while count <= upto do
    box[keys[count]] = values[count]
    count = count + 1
  end
  return box
end

-- Shortening the Lua require function
-- @param module path of the module
-- @return the item that the file returns after loading
function M.rq(item)
  return require(item)
end

-- Shortening print and inspect function
-- @param item the table that needs to be inspected
function M.pi(item)
  print(inspect(item))
end

-- Shortening print and type
-- @param item the value whose type needs to be printed
function M.tp(item)
  print(type(item))
end

-- Checks if a path actually exists.
-- @param path the path that needs to be checked
-- @return boolean true if exists false, otherwise
-- @see help empty()
-- @see help glob()
function M.exists(path)
  if fn.empty(fn.glob(path)) > 0 then
    return false
  end
  return true
end

-- A simple callback that allows arguments.
-- @param callback the callback function
-- @param @{...} the arguments that needs to be passed over to the callback.
function M.excallback(callback, ...)
  callback(...)
end

-- Buffer acts like browser tabs. Closing the last buffer will essentially
-- close the editor.
-- @see Adapted from https://is.gd/zosxpN
function M.delete_buffer()
  local buflisted = fn.getbufinfo { buflisted = 1 }
  local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
  if #buflisted < 2 then
    cmd "confirm qall"
    return
  end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    cmd(string.format("%d wincmd w", fn.win_id2win(winid)))
    cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

return M

-- vim:ft=lua
