require "globals"
require "options"
require "commands"
require "autocmds"
require "abbrevs"

if fn.empty(fn.glob(install_path)) > 0 or fn.empty(fn.glob(compile_path)) > 0 then
  require "plugins"
end

pcall(function()
  require "configs.impatient"
end)

-- vim:ft=lua
