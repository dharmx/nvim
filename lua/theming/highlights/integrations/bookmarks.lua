local colors = require("utils.theming").get_active_theme()

return {
  ["BookmarkSign"] = {
    fg = colors.common.base13,
    bold = true,
  },
  ["BookmarkAnnotationSign"] = {
    fg = colors.common.base07,
    bold = true,
  },
  ["BookmarkLine"] = {
    fg = colors.common.base13,
  },
  ["BookmarkAnnotationLine"] = {
    fg = colors.common.base09,
  },
}

-- vim:ft=lua
