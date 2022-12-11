vim.g.lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local stat = vim.loop.fs_stat(vim.g.lazypath)

if not stat then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    vim.g.lazypath,
  })
end

vim.opt.rtp:prepend(vim.g.lazypath)
require("dharmx.plug.config.core.lazy")

-- vim:filetype=lua
