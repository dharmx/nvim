--- Utilities for debugging and convenience.

local M = {}

local fn = vim.fn

--- Shortening the Lua require function
-- @param module path of the module
-- @return the item that the file returns after loading
function M.rq(item)
  return require(item)
end

--- Shortening print and type
-- @param item the value whose type needs to be printed
function M.tp(item)
  print(type(item))
end

function M.rgb_to_hex(r, g, b)
  return ("#%02X%02X%02X"):format(r, g, b)
end

--- Checks if a path actually exists.
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

--- Buffer acts like browser tabs. Closing the last buffer will essentially
--- close the editor.
-- @see Adapted from https://is.gd/zosxpN
function M.delete_buffer()
  local buflisted = fn.getbufinfo({
    buflisted = 1,
  })
  local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
  if #buflisted < 2 then
    vim.cmd("confirm qall")
    return
  end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    vim.cmd(string.format("%d wincmd w", fn.win_id2win(winid)))
    vim.cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  vim.cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  vim.cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

M.table = {
  some = function(tbl, cb)
    for k, v in pairs(tbl) do
      if cb(k, v) then
        return true
      end
    end
    return false
  end,
}

return M

-- vim:ft=lua
