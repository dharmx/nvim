local ok, escape = pcall(require, "better_escape")
if not ok then return end

escape.setup({
  mapping = { "jk", "jj" },
  timeout = vim.o.timeoutlen,
  clear_empty_lines = false,
  keys = "<Esc>",
})
