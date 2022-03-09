require "globals"
require "options"
require "commands"
require "autocmds"
require "abbrevs"

if fn.empty(fn.glob(stdpath "data" .. "/site/pack/packer/opt/packer.nvim")) > 0 then
  require "plugins"
end

pcall(function()
  require "configs.impatient"
end)

-- vim:ft=lua
