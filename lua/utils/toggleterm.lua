local T = {}

function T._TERM_KEYMAPS()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

local Terminal = require("toggleterm.terminal").Terminal

function T._LAZYGIT_TOGGLE()
  local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
  lazygit:toggle()
end

function T._NODE_TOGGLE()
  local node = Terminal:new { cmd = "node", hidden = true }
  node:toggle()
end

function T._BTOP_TOGGLE()
  local btop = Terminal:new { cmd = "btop", hidden = true }
  btop:toggle()
end

function T._PYTHON_TOGGLE()
  local python = Terminal:new { cmd = "python", hidden = true }
  python:toggle()
end

function T._BPYTHON_TOGGLE()
  local bython = Terminal:new { cmd = "bpython", hidden = true }
  bython:toggle()
end

function T._PYPY_TOGGLE()
  local pypy = Terminal:new { cmd = "pypy", hidden = true }
  pypy:toggle()
end

function T._LUA_TOGGLE()
  local lua = Terminal:new { cmd = "lua", hidden = true }
  lua:toggle()
end

function T._RANGER_TOGGLE()
  local ranger = Terminal:new { cmd = "ranger", hidden = true }
  ranger:toggle()
end

function T._ZSH_TOGGLE()
  local zsh = Terminal:new { cmd = "zsh", hidden = true }
  zsh:toggle()
end

function T._BASH_TOGGLE()
  local bash = Terminal:new { cmd = "bash", hidden = true }
  bash:toggle()
end

function T._FISH_TOGGLE()
  local fish = Terminal:new { cmd = "fish", hidden = true }
  fish:toggle()
end

function T._GROOVY_TOGGLE()
  local groovy = Terminal:new { cmd = "groovysh", hidden = true }
  groovy:toggle()
end

function T._JSHELL_TOGGLE()
  local jshell = Terminal:new { cmd = "jshell", hidden = true }
  jshell:toggle()
end

function T._BLUETOOTHCTL_TOGGLE()
  local btctl = Terminal:new { cmd = "bluetoothctl", hidden = true }
  btctl:toggle()
end

return T

-- vim:ft=lua
