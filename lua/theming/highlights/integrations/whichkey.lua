local colors = require("utils.theming").get_active_theme()

return {
  ["WhichKeyGroup"] = {
    fg = colors.common.base11,
    bold = true,
  },
  ["WhichKeyDesc"] = {
    fg = colors.common.base08,
  },
  ["WhichKeySeparator"] = {
    fg = colors.common.base09,
  },
  ["WhichKeyValue"] = {
    fg = colors.common.base14,
  },
  ["WhichKey"] = {
    fg = colors.common.base14,
  },
  ["WhichKeyFloat"] = {
    link = "FloatBorder",
  },
}

-- vim:ft=lua
