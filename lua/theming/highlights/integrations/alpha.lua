local colors = require("utils.theming").get_active_theme()

return {
  ["AlphaKeyPrefix"] = {
    fg = colors.common.base01,
    bg = colors.common.base09,
    bold = true,
  },
  ["AlphaHeading"] = {
    fg = colors.shades.shade02,
  },
  ["AlphaLoaded"] = {
    fg = colors.shades.shade02,
  },
  ["AlphaFooting"] = {
    fg = colors.common.base15,
    bold = true,
  },
  ["AlphaScroll"] = {
    fg = colors.common.base15,
  },
  ["AlphaButtonLabelText"] = {
    fg = colors.common.base08,
  },
}

-- vim:ft=lua
