local M = {}

M.mappings = {
  ["name"] = " Pandoc",
  ["r"] = {
    "<CMD>require('pandoc').render.init()<CR>",
    " Render",
  },
  ["b"] = {
    "<CMD>require('utils.plugins').pandoc_build()<CR>",
    " Build",
  },
  ["e"] = {
    "<CMD>require('pandoc').equation.show()<CR>",
    " Equation",
  },
}

M.options = {
  mode = "n",
  prefix = "<leader>j",
  silent = true,
  noremap = true,
}

return M

-- vim:ft=lua
