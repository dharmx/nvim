local M = {}

M.mappings = {
  ["name"] = " Terminal",
  ["n"] = { "<CMD>lua require('utils.toggleterm')._NODE_TOGGLE()<CR>", " Node" },
  ["t"] = { "<CMD>lua require('utils.toggleterm')._BTOP_TOGGLE()<CR>", " Btop" },
  ["p"] = { "<CMD>lua require('utils.toggleterm')._PYTHON_TOGGLE()<CR>", " Python" },
  ["b"] = { "<CMD>lua require('utils.toggleterm')._BPYTHON_TOGGLE()<CR>", " BPython" },
  ["y"] = { "<CMD>lua require('utils.toggleterm')._PYPY_TOGGLE()<CR>", " PyPy" },
  ["x"] = { "<CMD>lua require('utils.toggleterm')._FISH_TOGGLE()<CR>", " Fish" },
  ["k"] = { "<CMD>lua require('utils.toggleterm')._BASH_TOGGLE()<CR>", " Bash" },
  ["z"] = { "<CMD>lua require('utils.toggleterm')._ZSH_TOGGLE()<CR>", " Zsh" },
  ["i"] = { "<CMD>lua require('utils.toggleterm')._POSIX_TOGGLE()<CR>", " Sh" },
  ["r"] = { "<CMD>lua require('utils.toggleterm')._RANGER_TOGGLE()<CR>", " Ranger" },
  ["l"] = { "<CMD>lua require('utils.toggleterm')._LUA_TOGGLE()<CR>", " Lua" },
  ["j"] = { "<CMD>lua require('utils.toggleterm')._JSHELL_TOGGLE()<CR>", " JShell" },
  ["g"] = { "<CMD>lua require('utils.toggleterm')._GROOVY_TOGGLE()<CR>", " GroovySh" },
  ["c"] = { "<CMD>lua require('utils.toggleterm')._BLUETOOTHCTL_TOGGLE()<CR>", " BluetoothCTL" },
  ["f"] = { "<CMD>ToggleTerm direction=float<CR>", " Float" },
  ["h"] = { "<CMD>ToggleTerm size=10 direction=horizontal<CR>", " Horizontal" },
  ["v"] = { "<CMD>ToggleTerm size=80 direction=vertical<CR>", " Vertical" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader>/",
  nowait = true,
}

return M

-- vim:ft=lua
