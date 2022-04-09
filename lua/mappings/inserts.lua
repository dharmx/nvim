local M = {}

M.mappings = {
  ["<F9>"] = { "<CMD>BookmarkToggle<CR>", " Add/Remove bookmark" },
}

M.options = {
  mode = "i",
  silent = true,
  noremap = false,
  nowait = true,
}

return M

-- vim:ft=lua
