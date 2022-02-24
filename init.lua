require "highlights"
require "settings"

local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  require "plugins"
end

pcall(function() 
  require "configs.core.impatient"
end)
