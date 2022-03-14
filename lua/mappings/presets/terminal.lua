local M = {}

M.mappings = {
  name = " Terminal",
  n = { "<CMD>lua _NODE_TOGGLE()<CR>", " Node" },
  t = { "<CMD>lua _BTOP_TOGGLE()<CR>", " Btop" },
  p = { "<CMD>lua _PYTHON_TOGGLE()<CR>", " Python" },
  f = { "<CMD>ToggleTerm direction=float<CR>", " Float" },
  h = { "<CMD>ToggleTerm size=10 direction=horizontal<CR>", " Horizontal" },
  v = { "<CMD>ToggleTerm size=80 direction=vertical<CR>", " Vertical" },
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
