vim.keymap.set("n", "q", vim.cmd.bd, {
  desc = "Quit on one keystroke.",
  buffer = vim.api.nvim_get_current_buf(),
})
