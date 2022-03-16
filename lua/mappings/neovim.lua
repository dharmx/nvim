local M = {}

M.mappings = {
  ["l<CR>"] = { "<CMD>LspStart<CR>", " LSP start" },
  ["T"] = { "<CMD>TSStart<CR>", " Treesitter start" },
  ["L"] = { "<CMD>TSStart<CR><CMD>LspStart<CR><CMD>lua require('telescope')<CR>", " Code ready" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader>",
  nowait = true,
}

return M

-- vim:ft=lua
