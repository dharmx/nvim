local colors = require("utils.theming").get_active_theme()

return {
  ["LightBulbFloatWin"] = {
    fg = colors.common.base09,
    bg = colors.shades.shade08,
    bold = true,
  },
  ["LightBulbVirtualText"] = {
    fg = colors.common.base12,
    bold = true,
  },
}

-- vim:ft=lua
