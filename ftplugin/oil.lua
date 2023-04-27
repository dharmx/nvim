vim.keymap.set("n", "q", vim.cmd.quit, {
  desc = "Quit on one keystroke.",
  buffer = vim.api.nvim_get_current_buf(),
})

vim.opt_local.number = true
vim.opt_local.winhighlight = "Normal:NvimTreeNormal,VertSplit:NvimTreeVertSplit,WinBar:NvimTreeNormal,WinBarNC:NvimTreeNormal,LineNr:NvimTreeVertSplit"
