local H = {}

function H.get_active_scheme()
  return require("theming.schemes." .. __KRAKEN.theme.colorscheme)
end

function H.highlight(group, colors)
  if colors.link then
    H.link(group, colors.link)
    return
  end

  local background = colors.background or "NONE"
  local foreground = colors.foreground or "NONE"
  local decoration = colors.decoration or "NONE"
  local special = colors.decoration or "NONE"

  local prepared = string.format(
    "highlight %s guibg=%s guifg=%s gui=%s guisp=%s",
    group,
    background,
    foreground,
    decoration,
    special
  )

  cmd(prepared)
end

function H.link(from, to)
  local prepared = string.format("highlight! link %s %s", from, to)
  cmd(prepared)
end

function H.apply(options)
  local enums = require "theming.utils.enums"
  local base = enums.base

  local theme = enums.supports.theme
  local syntax = enums.supports.syntax

  local loaded_theme = require("theming.schemes." .. options.scheme)

  local set = function(groups)
    for group, colors in pairs(groups) do
      H.highlight(group, colors)
    end
  end

  local disabled = function(plugin)
    if not options.disable then
      return false
    end

    for _, item in ipairs(options.disable) do
      if plugin == item then
        return true
      end
    end

    return false
  end

  for name, config in pairs(theme) do
    if not disabled(name) then
      set(config(loaded_theme))
    end
  end

  for name, config in pairs(syntax) do
    if not disabled(name) then
      set(config(loaded_theme.syntax))
    end
  end

  for name, config in pairs(base.syntax) do
    if not disabled(name) then
      set(config(loaded_theme.syntax))
    end
  end

  base.terminal(loaded_theme)
  set(base.ui(loaded_theme))
end

return H
