local colors = require("utils.theming").get_active_theme()

return {
  ["HopNextKey"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["HopNextKey1"] = {
    fg = colors.common.base07,
    bold = true,
  },
  ["HopNextKey2"] = {
    fg = colors.common.base07,
  },
  ["HopUnmatched"] = {
    fg = colors.common.base03,
  },
}

-- vim:ft=lua
