local _ = require "settings"

if not exists(INSTALL_PATH) or not exists(COMPILE_PATH) then
  local _ = require "plugins"
end

local _ = pcall(require, "configs.core.impatient")

-- vim:ft=lua
