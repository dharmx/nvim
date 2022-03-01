local present, nvimrc = pcall(require, "nvimrc")
if not present then
  present, nvimrc = pcall(require, "usercfg.nvimrc")
end

if present then
  __KRAKEN = vim.tbl_deep_extend("keep", nvimrc, require "utils.defaultrc")
else
  vim.api.nvim_notify("nvimrc absent, using defaultrc instead", vim.log.levels.WARN, { title = "[KrakenVim]" })
  __KRAKEN = require "utils.defaultrc"
end

if __KRAKEN.ILOVEBLOAT ~= "YES!" then
  return
end

require "settings"
require "theming"

if vim.version().minor < 5 then
  vim.api.nvim_notify("This config needs at least nvim-0.5 to work!", vim.log.levels.ERROR, { title = "[KrakenVim]" })
  return
end

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  require "plugins"
end

require "configs.core.impatient"
