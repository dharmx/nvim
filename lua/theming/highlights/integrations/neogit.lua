local colors = require("utils.theming").get_active_theme()

return {
  ["NeogitBranch"] = {
    fg = colors.common.base10,
  },
  ["NeogitRemote"] = {
    fg = colors.common.base09,
  },
  ["NeogitHunkHeader"] = {
    fg = colors.common.base08,
  },
  ["NeogitHunkHeaderHighlight"] = {
    fg = colors.common.base08,
    bg = colors.common.base02,
  },
  ["NeogitDiffContextHighlight"] = {
    bg = colors.common.base01,
  },
  ["NeogitDiffDeleteHighlight"] = {
    fg = colors.common.base11,
    reverse = true,
  },
  ["NeogitDiffAddHighlight"] = {
    fg = colors.common.base14,
    reverse = true,
  },
}

-- vim:ft=lua
