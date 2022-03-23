local M = {}

function M.get_active_scheme()
  return require("theming.schemes." .. colorscheme)
end

function M.highlight(group, colors)
  if colors.link then
    M.link(group, colors.link)
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

function M.link(from, to)
  local prepared = string.format("highlight! link %s %s", from, to)
  cmd(prepared)
end

function M.apply(options)
  local enums = require "tables.theming"
  local base = enums.base

  local theme = enums.supports.theme
  local syntax = enums.supports.syntax

  local loaded_theme = require("theming.schemes." .. options.scheme)

  local function set(groups)
    for group, colors in pairs(groups) do
      M.highlight(group, colors)
    end
  end

  local function disabled(plugin)
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
  set(base.custom(loaded_theme))
  set(base.statusline(loaded_theme))
end

return M

-- vim:ft=lua
