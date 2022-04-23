-- setup vim options, auto-commands, user commands, etc.
require "settings"

-- bootstrap
-- if packer doesn't exists then clone and generate plugins spec
-- if packer plugin spec file doesn't exist then generate it
if not exists(PACKER_INSTALL_PATH) or not exists(PACKER_COMPILE_PATH) then
  require "plugins"
end

-- Load plugin specs and statusline
pcall(require, "configs.core.impatient")
require "statusline"

-- vim:ft=lua
