_ = require "settings"

if not exists(INSTALL_PATH) or not exists(COMPILE_PATH) then
  local _ = require "plugins"
end

-- As there isn't any plugin specification file available on a fresh
-- install the chances of error inscreases as, impatient looks for a
-- plugin specification file.
local _ = pcall(require, "configs.core.impatient")

-- vim:ft=lua
