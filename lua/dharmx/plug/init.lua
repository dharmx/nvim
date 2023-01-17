local MainConfig = require("dharmx")

if not MainConfig.lazy("install") then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    MainConfig.lazy.install,
  })
end

vim.opt.rtp:prepend(MainConfig.lazy.install)
require("dharmx.plug.config.core.lazy")

-- vim:filetype=lua
