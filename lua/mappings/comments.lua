local M = {}

M.mappings = {
  ["<C-_>"] = { "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment line" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = false,
  nowait = true,
}

return M

-- vim:ft=lua
