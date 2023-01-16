local config = require("dharmx")
local stat = vim.loop.fs_stat(config.pacman.install)

if not stat then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    config.pacman.install,
  })
end

vim.opt.rtp:prepend(config.pacman.install)
require("dharmx.plug.config.core.lazy")

-- vim:filetype=lua
