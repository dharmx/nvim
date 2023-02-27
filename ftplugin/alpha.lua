vim.keymap.set("n", "q", vim.cmd.Alpha, {
  desc = "Quit on one keystroke.",
  buffer = vim.api.nvim_get_current_buf(),
})
