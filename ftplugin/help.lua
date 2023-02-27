vim.opt_local.wrap = false
vim.opt_local.signcolumn = "no"
vim.cmd("wincmd L", false)

vim.keymap.set("n", "q", vim.cmd.quit, {
  desc = "Quit on one keystroke.",
  buffer = vim.api.nvim_get_current_buf(),
})
