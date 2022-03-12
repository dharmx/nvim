local M = {}

M.mappings = {
  ["name"] = " LSP",
  ["l<CR>"] = { "<CMD>LspStart<CR>", " LSP start" },
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
