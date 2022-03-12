_ = require "globals"
_ = require "settings"

if fn.empty(fn.glob(install_path)) > 0 then
  _ = require "plugins"
end

if fn.empty(fn.glob(compile_path)) > 0 then
  _ = require "plugins"
end

-- As there isn't any plugin specification file available on a fresh
-- install the chances of error inscreases as, impatient looks for a
-- plugin specification file.
pcall(function()
  _ = require "configs.impatient"
end)

-- vim:ft=lua
