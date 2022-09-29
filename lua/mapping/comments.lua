local M = {}

M.mappings = {
  ["ghh"] = {
    "<CMD>lua require('Comment.api').toggle_current_linewise(); vim.notify 'Toggled current_linewise'<CR>",
    "Comment line",
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = false,
  nowait = true,
}

return M

-- vim:ft=lua
