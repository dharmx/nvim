require "settings.env" -- convenient vim API utils that are global-scoped
require "settings.utils" -- user-made utils that are frequently used

-- disabled vim plugins
local builtins = require "settings.builtins"
for builtin, status in pairs(builtins) do
  g["loaded_" .. builtin] = status
end

-- global nvim options
local globals = require "settings.globals"
for name, value in pairs(globals) do
  g[name] = value
end

-- vim.opt values that are assigned to the option
local optionals = require "settings.optionals"
for item, value in pairs(optionals.options) do
  opt[item] = value
end

-- vim.opt values that are appended to the option
for item, value in pairs(optionals.appends) do
  opt[item]:append(value)
end

-- vim.opt values that are prepended to the option
for item, value in pairs(optionals.exports) do
  env[item] = value
end

-- auto-commands that are enabled
-- @see module @{settings.autocmds}
local autocmds = require "settings.autocmds"
for _, preset in ipairs {
  "NativeAdjustments",
  "NvimTreeAutoClose",
  "AutoPlugSpecCompileOnChange",
  "YankFeedback",
  "NotifyOnPackerOperation",
  "ReplaceModes",
  "SetTelescopeBufferName",
} do
  augroup(preset, autocmds[preset])
end

-- user-commands that are enabled
-- @see module @{settings.commands}
schedule(function()
  local commands = require "settings.commands"
  for _, name in pairs {
    "TSStart",
    "FormatConfigAll",
    "GitHL",
    "TabLineTGL",
    "StatusLineTGL",
    "SpellingTGL",
    "SpotifyExit",
    "PackerInstall",
    "PackerUpdate",
    "PackerSync",
    "PackerLoad",
    "PackerClean",
    "PackerCompile",
    "PackerProfile",
    "PackerStatus",
    "PersistClip",
    "Shade",
    "ScratchTele",
  } do
    local target = commands[name]
    if type(target) == "string" then
      alias(name, target, {})
    else
      alias(name, target.command, target.options)
    end
  end
end)

-- abbreviations that are enabled
-- @see module @{settings.abbrevs}
schedule(function()
  local abbrevs = require "settings.abbrevs"
  for _, name in ipairs { "AutoCorrectQuitSaveCase" } do
    for _, item in ipairs(abbrevs[name]) do
      abbrev(item.buffer, item.command, item.expression)
    end
  end
end)

-- schedule reading of the shadafile in order to increase the startup time
opt.shadafile = "NONE"
schedule(function()
  opt.shadafile = ""
  cmd "silent! rsh"
end)

-- vim:ft=lua
