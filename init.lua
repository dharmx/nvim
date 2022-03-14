_ = require "settings"

if not exists(install_path) or not exists(compile_path) then
  _ = require "plugins"
end

-- As there isn't any plugin specification file available on a fresh
-- install the chances of error inscreases as, impatient looks for a
-- plugin specification file.
_ = pcall(require, "configs.core.impatient")

-- vim:ft=lua
