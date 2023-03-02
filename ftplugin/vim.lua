if vim.fn.bufname() == "[Command Line]" then
  vim.opt_local.signcolumn = "no"
  vim.opt_local.relativenumber = false

  vim.keymap.set("n", "q", vim.cmd.quit, {
    desc = "Quit on one keystroke.",
    buffer = vim.api.nvim_get_current_buf(),
    silent = true,
  })
end
