local exists = require("utils").exists
local nv = require("utils.neovim")
local fn = vim.fn

local PACKER_BOOTSTRAP = false
local PACKER_INSTALL_PATH = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
local PACKER_COMPILE_PATH = fn.stdpath("config") .. "/lua/plugin/compiledSpec.lua"

if not exists(PACKER_INSTALL_PATH) then
  nv.notify("packer.nvim doesn't exist. Cloning...")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    PACKER_INSTALL_PATH,
  })

  if not pcall(vim.cmd, "packadd packer.nvim") then
    nv.notify("Check your internet connection.")
  end
end

if not exists(PACKER_COMPILE_PATH) then
  nv.notify("Couldn't find plugin specifications. Syncing now...")
  PACKER_BOOTSTRAP = true
  pcall(vim.cmd, "packadd packer.nvim")
end

local packer = require("packer")
packer.init(require("plugin.config.core.packer"))
packer.reset()

require("plugin.spec.core")
require("plugin.spec.dev")
require("plugin.spec.editing")
require("plugin.spec.workflow")
require("plugin.spec.lsp")
require("plugin.spec.telescope")
require("plugin.spec.utils")
require("plugin.spec.treesitter")
require("plugin.spec.ui")
require("plugin.spec.others")
require("plugin.spec.cmp")
require("plugin.spec.wellbeing")

if PACKER_BOOTSTRAP then
  packer.on_compile_done = function()
    nv.notify({
      message = "Run :LspInstall and :TSStart",
      icon = " ",
      title = "KrakeNvim",
    })
  end
  packer.sync()
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})

-- vim:ft=lua
