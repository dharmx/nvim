local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.notify "packer.nvim doesn't exist. Cloning..."
  bootstrap = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  cmd "packadd packer.nvim"
end

local packer = require "packer"
packer.init(require "configs.core.packer_nvim")

use = packer.use
use_rocks = packer.use_rocks
packer.reset()

for _, state in pairs(__KRAKEN.modules) do
  if state.enabled then
    require(state.import)
  end
end

if bootstrap then
  packer.install()
  packer.compile()
  vim.api.nvim_notify("KrakenVim is now ready to go!", vim.log.levels.INFO, { title = "packer.nvim", icon = " " })
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})
