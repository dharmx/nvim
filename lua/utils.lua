local M = {}
local cmd = vim.api.nvim_command

function M.dashboard_vimenter()
  if vim.api.nvim_buf_get_option(0, "ft") == "" then
    vim.api.nvim_command "Dashboard"
  end
end

function M.delete_buffer()
  local buflisted = vim.fn.getbufinfo { buflisted = 1 }
  local cur_winnr, cur_bufnr = vim.fn.winnr(), vim.fn.bufnr()
  if #buflisted < 2 then
    cmd "confirm qall"
    return
  end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    cmd(string.format("%d wincmd w", vim.fn.win_id2win(winid)))
    cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = vim.fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

function M.map(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

function M.buf_opt(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

function M.notify_info(title, message, icon)
  vim.api.nvim_notify(message, vim.log.levels.INFO, { title = title, icon = icon })
end

function M.alias(from, to)
  vim.api.nvim_command("command! " .. from .. " " .. to)
end

return M
