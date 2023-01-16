local lazypath = require("dharmx").lazypath
local stat = vim.loop.fs_stat(lazypath)

if not stat then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("dharmx.plug.config.core.lazy")

-- vim:filetype=lua
