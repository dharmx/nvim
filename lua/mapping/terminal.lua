local M = {}

M.mappings = {
  ["<leader>/"] = {
    ["name"] = " Consoles",
    ["n"] = {
      "<CMD>lua require('utils.term')._NODE_TOGGLE()<CR>",
      " Node",
    },
    ["t"] = {
      "<CMD>lua require('utils.term')._BTOP_TOGGLE()<CR>",
      " Btop",
    },
    ["p"] = {
      "<CMD>lua require('utils.term')._PYTHON_TOGGLE()<CR>",
      " Python",
    },
    ["b"] = {
      "<CMD>lua require('utils.term')._BPYTHON_TOGGLE()<CR>",
      " BPython",
    },
    ["y"] = {
      "<CMD>lua require('utils.term')._PYPY_TOGGLE()<CR>",
      " PyPy",
    },
    ["x"] = {
      "<CMD>lua require('utils.term')._FISH_TOGGLE()<CR>",
      " Fish",
    },
    ["k"] = {
      "<CMD>lua require('utils.term')._BASH_TOGGLE()<CR>",
      " Bash",
    },
    ["z"] = {
      "<CMD>lua require('utils.term')._ZSH_TOGGLE()<CR>",
      " Zsh",
    },
    ["i"] = {
      "<CMD>lua require('utils.term')._POSIX_TOGGLE()<CR>",
      " Sh",
    },
    ["r"] = {
      "<CMD>lua require('utils.term')._RANGER_TOGGLE()<CR>",
      " Ranger",
    },
    ["l"] = {
      "<CMD>lua require('utils.term')._LUA_TOGGLE()<CR>",
      " Lua",
    },
    ["j"] = {
      "<CMD>lua require('utils.term')._JSHELL_TOGGLE()<CR>",
      " JShell",
    },
    ["g"] = {
      "<CMD>lua require('utils.term')._GROOVY_TOGGLE()<CR>",
      " GroovySh",
    },
    ["c"] = {
      "<CMD>lua require('utils.term')._BLUETOOTHCTL_TOGGLE()<CR>",
      " BluetoothCTL",
    },
    ["m"] = {
      "<CMD>lua require('utils.term')._HILBISH_TOGGLE()<CR>",
      " Hilbish",
    },
    ["f"] = {
      "<CMD>ToggleTerm direction=float<CR>",
      " Float",
    },
    ["h"] = {
      "<CMD>ToggleTerm size=10 direction=horizontal<CR>",
      " Horizontal",
    },
    ["v"] = {
      "<CMD>ToggleTerm size=80 direction=vertical<CR>",
      " Vertical",
    },
  },
  ["<C-\\>"] = {
    "<CMD>ToggleTerm<CR>",
    "ToggleTerm",
  }
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = true,
}

return M

-- vim:ft=lua
