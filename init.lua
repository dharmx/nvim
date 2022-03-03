require "theming"
require "options"
require "commands"
require "autocmds"

if vim.fn.empty(vim.fn.glob(vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim")) > 0 then
  require "plugins"
end
require "configs.impatient_nvim"
