-- setup vim options, auto-commands, user commands, etc.
require("setting")

local stdpath = vim.fn.stdpath
local exists = require("utils").exists

local pk_install = exists(stdpath("data") .. "/site/pack/packer/opt/packer.nvim")
local pk_compile = exists(stdpath("config") .. "/lua/plugin/compiledSpec.lua")

-- bootstrap
-- if packer doesn't exist then clone and generate plugins spec
-- if packer plugin spec file doesn't exist then generate it
if not pk_install or not pk_compile then
  require("plugin.spec")
end

-- Load plugin specs and statusline
pcall(require, "plugin.config.core.impatient")
require("stline").setup()

-- vim:filetype=lua
