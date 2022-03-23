local T = {}

function T._TERM_KEYMAPS()
  local options = {
    silent = true,
    noremap = false,
    nowait = true,
  }

  api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], options)
  api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], options)
  api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
  api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
  api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
  api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], options)
end

local Terminal = require("toggleterm.terminal").Terminal

function T._LAZYGIT_TOGGLE()
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "solid",
    },
    size = 28,
  }
  lazygit:toggle()
end

function T._NODE_TOGGLE()
  local node = Terminal:new {
    cmd = "node",
    hidden = true,
    direction = "horizontal",
  }
  node:toggle()
end

function T._BTOP_TOGGLE()
  local btop = Terminal:new {
    cmd = "btop",
    hidden = true,
    direction = "float",
    size = 25,
    float_opts = {
      border = "solid",
    },
  }
  btop:toggle()
end

function T._PYTHON_TOGGLE()
  local python = Terminal:new {
    cmd = "python",
    hidden = true,
    direction = "horizontal",
    size = 20,
  }
  python:toggle()
end

function T._BPYTHON_TOGGLE()
  local bython = Terminal:new {
    cmd = "bpython",
    hidden = true,
    direction = "horizontal",
    size = 20,
  }
  bython:toggle()
end

function T._PYPY_TOGGLE()
  local pypy = Terminal:new {
    cmd = "pypy",
    hidden = true,
    direction = "horizontal",
    size = 20,
  }
  pypy:toggle()
end

function T._LUA_TOGGLE()
  local lua = Terminal:new {
    cmd = "lua",
    hidden = true,
    direction = "horizontal",
    size = 18,
  }
  lua:toggle()
end

function T._RANGER_TOGGLE()
  local ranger = Terminal:new {
    cmd = "ranger",
    hidden = true,
    direction = "float",
    size = 30,
    float_opts = {
      border = "solid",
    },
  }
  ranger:toggle()
end

function T._ZSH_TOGGLE()
  local zsh = Terminal:new {
    cmd = "zsh",
    hidden = true,
    direction = "horizontal",
    size = 25,
  }
  zsh:toggle()
end

function T._BASH_TOGGLE()
  local bash = Terminal:new {
    cmd = "bash",
    hidden = true,
    direction = "horizontal",
    size = 25,
  }
  bash:toggle()
end

function T._FISH_TOGGLE()
  local fish = Terminal:new {
    cmd = "fish",
    hidden = true,
    direction = "horizontal",
    size = 25,
  }
  fish:toggle()
end

function T._POSIX_TOGGLE()
  local fish = Terminal:new {
    cmd = "sh",
    hidden = true,
    direction = "horizontal",
    size = 17,
  }
  fish:toggle()
end

function T._GROOVY_TOGGLE()
  local groovy = Terminal:new {
    cmd = "groovysh",
    hidden = true,
    direction = "horizontal",
    size = 20,
  }
  groovy:toggle()
end

function T._JSHELL_TOGGLE()
  local jshell = Terminal:new {
    cmd = "jshell",
    hidden = true,
    direction = "horizontal",
    size = 20,
  }
  jshell:toggle()
end

function T._BLUETOOTHCTL_TOGGLE()
  local btctl = Terminal:new {
    cmd = "bluetoothctl",
    hidden = true,
    direction = "float",
    width = 150,
  }
  btctl:toggle()
end

return T

-- vim:ft=lua
