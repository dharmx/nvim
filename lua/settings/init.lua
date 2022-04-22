require "settings.aliases" -- user-made utils that are frequently used
require "settings.builtins" -- disable redundant vim-plugs
require "settings.abbrevs" -- abbreviations
require "settings.options" -- vim options
require "settings.globals" -- modify global vim variables
require "settings.autocmds" -- load auto-commands
require "settings.commands" -- load user-commands

-- schedule reading shadafile to improve the startup time
opt.shadafile = "NONE"
schedule(function()
  opt.shadafile = ""
  cmd "silent! rsh"
end)

-- vim:ft=lua
