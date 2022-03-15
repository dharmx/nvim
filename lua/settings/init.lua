_ = require "settings.env"
_ = require "settings.utils"

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
      "OpenDashboardOnBlankBuffer",
      "AutoPlugSpecCompileOnChange",
      "YankFeedback",
      "NotifyOnPackerOperation",
      "PersistentFileEditPosition",
    }
  do
    augroup(preset, autocmds[preset])
  end
end)

schedule(function()
  local commands = require "settings.commands"
  for command, target in pairs(commands.aliases) do
    alias(command, target)
  end

  for _, command in ipairs(commands.packer) do
    cmd(command)
  end
end)

schedule(function()
  local abbrevs = require "settings.abbrevs"
  for _, preset in ipairs(abbrevs) do
    abbrev(preset.buffer, preset.command, preset.expression)
  end
end)

opt.shadafile = "NONE"
schedule(function()
  opt.shadafile = ""
  cmd "silent! rsh"
end)

-- vim:ft=lua
