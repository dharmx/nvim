require "settings.env"
require "settings.utils"

local builtins = require "settings.builtins"
for builtin, status in pairs(builtins) do
  g["loaded_" .. builtin] = status
end

local globals = require "settings.globals"
for name, value in pairs(globals) do
  g[name] = value
end

local optionals = require "settings.optionals"
for item, value in pairs(optionals.options) do
  opt[item] = value
end

for item, value in pairs(optionals.appends) do
  opt[item]:append(value)
end

for item, value in pairs(optionals.exports) do
  env[item] = value
end

local autocmds = require "settings.autocmds"
for _, preset in
  ipairs {
    "NativeAdjustments",
    "NvimTreeAutoClose",
    "AutoPlugSpecCompileOnChange",
    "YankFeedback",
    "NotifyOnPackerOperation",
    "ReplaceModes",
  }
do
  augroup(preset, autocmds[preset])
end

schedule(function()
  local commands = require "settings.commands"
  for _, name in
    pairs {
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
    }
  do
    local target = commands[name]
    if type(target) == "string" then
      alias(name, target, {})
    else
      alias(name, target.command, target.options)
    end
  end
end)

schedule(function()
  local abbrevs = require "settings.abbrevs"
  for _, name in ipairs { "AutoCorrectQuitSaveCase" } do
    for _, item in ipairs(abbrevs[name]) do
      abbrev(item.buffer, item.command, item.expression)
    end
  end
end)

opt.shadafile = "NONE"
schedule(function()
  opt.shadafile = ""
  cmd "silent! rsh"
end)

-- vim:ft=lua
