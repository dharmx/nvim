local M = {}

function M.p(message)
  print(message)
end

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

function M.pi(item)
  print(inspect(item))
end

function M.exists(path)
  if fn.empty(fn.glob(path)) > 0 then
    return false
  end
  return true
end

function M.excallback(callback, ...)
  callback(...)
end

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
