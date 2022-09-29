local colors = require("utils.theming").get_active_theme()

return {
  ["YankFeed"] = {
    fg = colors.rainbow.cobalt,
    bold = true,
  },
  ["Hidden"] = {
    fg = colors.common.base00,
    bg = colors.common.base00,
  },
  ["LightBulbSign"] = {
    fg = colors.common.base13,
    bg = colors.common.base00,
  },
  ["Default"] = {
    fg = "NONE",
    bg = "NONE",
  },
}

-- vim:ft=lua
