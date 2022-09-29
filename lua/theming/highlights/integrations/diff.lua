local colors = require("utils.theming").get_active_theme()

return {
  ["diffAdded"] = {
    fg = colors.common.base14,
  },
  ["diffRemoved"] = {
    fg = colors.common.base11,
  },
  ["diffChanged"] = {
    fg = colors.common.base15,
  },
  ["diffOldFile"] = {
    fg = colors.common.base13,
  },
  ["diffNewFile"] = {
    fg = colors.common.base12,
  },
  ["diffFile"] = {
    fg = colors.common.base07,
  },
  ["diffLine"] = {
    fg = colors.common.base03,
  },
  ["diffIndexLine"] = {
    fg = colors.common.base09,
  },
  ["DiffAdd"] = {
    fg = colors.common.base14,
  },
  ["DiffChange"] = {
    fg = colors.common.base15,
  },
  ["DiffDelete"] = {
    fg = colors.common.base11,
  },
  ["DiffText"] = {
    fg = colors.common.base09,
  },
}

-- vim:ft=lua
