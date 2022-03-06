local M = {}
local cmd = vim.api.nvim_command

function M.lsp_signdef(group, icon, text_group)
  vim.fn.sign_define(group, {
    text = icon,
    texthl = text_group,
  })
end

function M.dashboard_vimenter()
  if vim.api.nvim_buf_get_name(0) == "" then
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
  for _, winid in ipairs(vim.fn.getbufinfo(cur_bufnr)[1].windows) do
    cmd(string.format("%d wincmd w", vim.fn.win_id2win(winid)))
    cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = vim.fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

function M.bmap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

function M.bopt(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

function M.notify_info(message, title)
  vim.api.nvim_notify(message, vim.log.levels.INFO, { title = title or "Alert!", icon = " " })
end

function M.alias(from, to)
  vim.api.nvim_command("command! " .. from .. " " .. to)
end

function M.map(key, command, options)
  if not options then
    options = {}
  end

  local opts = {
    mode = options.mode or "n",
    prefix = options.prefix or "<leader>",
    buffer = options.buffer,
    silent = options.silent or true,
    noremap = options.noremap or true,
    nowait = options.nowait or false,
  }

  local map = {
    name = options.heading or "בּ None",
    [key] = {
      "<CMD>" .. command .. "<CR>",
      options.name or "בּ None",
    },
  }
  require("which-key").register(map, opts)
end

function M.normal_map(key, command, options)
  if not options then
    options = {}
  end
  options.mode = "n"
  M.map(key, command, options)
end

function M.visual_map(object, prefix, key, command)
  if not options then
    options = {}
  end
  options.mode = "v"
  M.map(key, command, options)
end

function M.insert_map(object, prefix, key, command)
  if not options then
    options = {}
  end
  options.mode = "i"
  M.map(key, command, options)
end

function M.leader_normal_map(key, command, options)
  if not options then
    options = {}
  end
  options.mode = "n"
  options.prefix = "<leader>"
  M.map(key, command, options)
end

function M.leader_visual_map(key, command, options)
  if not options then
    options = {}
  end
  options.mode = "v"
  options.prefix = "<leader>"
  M.map(key, command, options)
end

return M
