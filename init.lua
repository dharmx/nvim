_ = require "settings"

if not exists(install_path) then
  _ = require "plugins"
end

if not exists(compile_path) then
  _ = require "plugins"
end

-- As there isn't any plugin specification file available on a fresh
-- install the chances of error inscreases as, impatient looks for a
-- plugin specification file.
pcall(function()
  _ = require "configs.impatient"
end)

-- vim:ft=lua
