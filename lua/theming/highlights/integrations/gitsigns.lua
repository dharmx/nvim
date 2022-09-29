local colors = require("utils.theming").get_active_theme()

return {
  ["GitSignsChange"] = {
    fg = colors.common.base02,
  },
  ["GitSignsChangeNr"] = {
    fg = colors.common.base15,
  },
  ["GitSignsChangeLn"] = {
    fg = colors.common.base15,
  },
  ["GitSignsAdd"] = {
    fg = colors.common.base09,
  },
  ["GitSignsAddNr"] = {
    fg = colors.common.base14,
  },
  ["GitSignsAddLn"] = {
    fg = colors.common.base14,
  },
  ["GitSignsDeleteLn"] = {
    fg = colors.common.base11,
  },
  ["GitSignsDelete"] = {
    fg = colors.common.base11,
  },
  ["GitSignsDeleteNr"] = {
    fg = colors.common.base11,
  },
}

-- vim:ft=lua
