local PACKER_BOOTSTRAP = false
if not exists(PACKER_INSTALL_PATH) then
  notify { message = "packer.nvim doesn't exist. Cloning..." }
  PACKER_BOOTSTRAP = system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    PACKER_INSTALL_PATH,
  }

  if not pcall(cmd, "packadd packer.nvim") then
    notify "Check your internet connection."
  end
end

if not exists(PACKER_COMPILE_PATH) then
  notify "Couldn't find plugin specifications. Syncing now..."
  PACKER_BOOTSTRAP = true
  pcall(cmd, "packadd packer.nvim")
end

local packer = require "packer"
packer.init(require "configs.core.packer")
packer.reset()
use = packer.use

require "plugins.dev"
require "plugins.editing"
require "plugins.workflow"
require "plugins.lsp"
require "plugins.telescope"
require "plugins.utils"
require "plugins.treesitter"
require "plugins.core"
require "plugins.ui"
require "plugins.others"
require "plugins.cmp"
require "plugins.health"
require "plugins.local"

if PACKER_BOOTSTRAP then
  packer.on_compile_done = schedule_wrap(function()
    pcall(require, "configs.core.impatient")
    notify {
      message = "Run :LspInstall and :TSStart",
      icon = " ",
      title = "KrakenVim",
    }
  end)
  packer.sync()
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})

-- vim:ft=lua
