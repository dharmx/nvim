local buffer = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "q", function() require("telescope.actions").close(buffer) end, {
  desc = "Quit on one keystroke.",
  buffer = buffer,
})
