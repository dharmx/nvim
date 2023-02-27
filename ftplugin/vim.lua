if vim.fn.bufname() == "[Command Line]" then
  vim.opt_local.signcolumn = "no"
  vim.opt_local.relativenumber = false
end
