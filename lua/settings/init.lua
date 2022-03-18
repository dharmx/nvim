local _ = require "settings.env"
local _ = require "settings.utils"

excallback(function()
  local builtins = require "settings.builtins"
  for builtin, status in pairs(builtins) do
    g["loaded_" .. builtin] = status
  end
end)

excallback(function()
  local globals = require "settings.globals"
  for name, value in pairs(globals) do
    g[name] = value
  end
end)

excallback(function()
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
end)

excallback(function()
  local autocmds = require "settings.autocmds"
  for _, preset in
    ipairs {
      "NativeAdjustments",
      "AutoPlugSpecCompileOnChange",
      "YankFeedback",
      "NotifyOnPackerOperation",
      "AlphaTriggered",
      "AutoDisableTablineStatusline",
    }
  do
    augroup(preset, autocmds[preset])
  end
end)

schedule(function()
  local commands = require "settings.commands"
  for name, target in pairs(commands) do
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
