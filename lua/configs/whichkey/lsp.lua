local M = {}

M.mappings = {
  ["name"] = " LSP",
  ["l<CR>"] = { "<CMD>LspStart<CR>", " LSP start" },
}

M.options = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
