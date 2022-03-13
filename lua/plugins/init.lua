if fn.empty(fn.glob(install_path)) > 0 then
  notify { message = "packer.nvim doesn't exist. Cloning..." }
  bootstrap = system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  cmd "packadd packer.nvim"
end

if fn.empty(fn.glob(compile_path)) > 0 then
  notify "Couldn't find plugin specifications. Syncing now..."
  bootstrap = true
  cmd "packadd packer.nvim"
end

local packer = require "packer"
packer.init(require "configs.packer")
use = packer.use
packer.reset()

for _, module in
  ipairs {
    "health",
    "completion",
    "core",
    "utils",
    "lsp",
    "treesitter",
    "others",
    "development",
    "editing",
    "workflow",
    "ui",
  }
do
  _ = require("plugins." .. module)
end

if bootstrap then
  packer.clean()
  packer.install()
  packer.compile()
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})

-- vim:ft=lua
