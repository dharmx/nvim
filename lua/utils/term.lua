--- toggleterm and terminal related utilities

local T = {}

local api = vim.api

--- Adds sets some ease-of-use keymaps when entering terminals.
--- For instance it usually takes the mouse to return to normal mode
--- when using a terminal as, the keypresses get passed onto the shell.
--- So, with this function called you can now use the <ESC> key again.
-- @see help nvim_buf_set_keymap
function T._TERM_KEYMAPS()
  local options = {
    silent = true,
    noremap = true,
    nowait = true,
  }

  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
  vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
  vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
  vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
  vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], options)
end

-- @see help toggleterm-Caveats
local Terminal = require("toggleterm.terminal").Terminal

--- Uses toggleterm to open a lazygit instance within neovim.
function T._LAZYGIT_TOGGLE()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "solid",
    },
    size = 28,
  })
  lazygit:toggle()
end

--- Uses toggleterm to open a node REPL instance within neovim.
function T._NODE_TOGGLE()
  local node = Terminal:new({
    cmd = "node",
    hidden = true,
    direction = "horizontal",
  })
  node:toggle()
end

--- Uses toggleterm to open a BTOP system monitor instance within neovim.
function T._BTOP_TOGGLE()
  local btop = Terminal:new({
    cmd = "btop",
    hidden = true,
    direction = "float",
    size = 25,
    float_opts = {
      border = "solid",
    },
  })
  btop:toggle()
end

--- Uses toggleterm to open a Python REPL instance within neovim.
function T._PYTHON_TOGGLE()
  local python = Terminal:new({
    cmd = "python",
    hidden = true,
    direction = "horizontal",
    size = 20,
  })
  python:toggle()
end

--- Uses toggleterm to open a Bpython REPL instance within neovim.
function T._BPYTHON_TOGGLE()
  local bython = Terminal:new({
    cmd = "bpython",
    hidden = true,
    direction = "horizontal",
    size = 20,
  })
  bython:toggle()
end

--- Uses toggleterm to open a Pypy REPL instance within neovim.
function T._PYPY_TOGGLE()
  local pypy = Terminal:new({
    cmd = "pypy",
    hidden = true,
    direction = "horizontal",
    size = 20,
  })
  pypy:toggle()
end

--- Uses toggleterm to open a Lua REPL instance within neovim.
function T._LUA_TOGGLE()
  local lua = Terminal:new({
    cmd = "lua",
    hidden = true,
    direction = "horizontal",
    size = 18,
  })
  lua:toggle()
end

--- Uses toggleterm to open a Ranger instance within neovim.
function T._RANGER_TOGGLE()
  local ranger = Terminal:new({
    cmd = "ranger",
    hidden = true,
    direction = "float",
    size = 30,
    float_opts = {
      border = "solid",
    },
  })
  ranger:toggle()
end

--- Uses toggleterm to open a ZSH shell instance within neovim.
function T._ZSH_TOGGLE()
  local zsh = Terminal:new({
    cmd = "zsh",
    hidden = true,
    direction = "horizontal",
    size = 25,
  })
  zsh:toggle()
end

--- Uses toggleterm to open a BASH shell instance within neovim.
function T._BASH_TOGGLE()
  local bash = Terminal:new({
    cmd = "bash",
    hidden = true,
    direction = "horizontal",
    size = 25,
  })
  bash:toggle()
end

--- Uses toggleterm to open a FISH shell instance within neovim.
function T._FISH_TOGGLE()
  local fish = Terminal:new({
    cmd = "fish",
    hidden = true,
    direction = "horizontal",
    size = 25,
  })
  fish:toggle()
end

--- Uses toggleterm to open a HILBISH shell instance within neovim.
function T._HILBISH_TOGGLE()
  local hilbish = Terminal:new({
    cmd = "hilbish",
    hidden = true,
    direction = "horizontal",
    size = 40,
  })
  hilbish:toggle()
end

--- Uses toggleterm to open a POSIX shell instance within neovim.
function T._POSIX_TOGGLE()
  local sh = Terminal:new({
    cmd = "sh",
    hidden = true,
    direction = "horizontal",
    size = 17,
  })
  sh:toggle()
end

--- Uses toggleterm to open a Groovy REPL instance within neovim.
function T._GROOVY_TOGGLE()
  local groovy = Terminal:new({
    cmd = "groovysh",
    hidden = true,
    direction = "horizontal",
    size = 20,
  })
  groovy:toggle()
end

--- Uses toggleterm to open a Java REPL instance within neovim.
function T._JSHELL_TOGGLE()
  local jshell = Terminal:new({
    cmd = "jshell",
    hidden = true,
    direction = "horizontal",
    size = 20,
  })
  jshell:toggle()
end

--- Uses toggleterm to open a BluetoothCTL instance within neovim.
function T._BLUETOOTHCTL_TOGGLE()
  local btctl = Terminal:new({
    cmd = "bluetoothctl",
    hidden = true,
    direction = "float",
    width = 150,
  })
  btctl:toggle()
end

return T

-- vim:ft=lua
