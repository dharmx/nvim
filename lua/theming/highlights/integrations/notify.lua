local colors = require("utils.theming").get_active_theme()

return {
  ["NotifyINFOBody"] = {
    bg = colors.shades.shade08,
    fg = colors.common.base09,
  },
  ["NotifyINFOBody2"] = {
    link = "NotifyINFOBody",
  },
  ["NotifyINFOBorder"] = {
    bg = colors.shades.shade08,
    fg = colors.shades.shade08,
  },
  ["NotifyINFOBorder2"] = {
    link = "NotifyINFOBody",
  },
  ["NotifyINFOIcon"] = {
    fg = colors.common.base15,
  },
  ["NotifyINFOIcon2"] = {
    fg = colors.common.base09,
  },
  ["NotifyINFOTitle"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["NotifyINFOTitle2"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["NotifyLogTime"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["NotifyLogTitle"] = {
    fg = colors.common.base08,
    bold = true,
  },
  ["NotifyWARNBody"] = {
    fg = colors.common.base01,
    bg = colors.common.base13,
  },
  ["NotifyWARNIcon"] = {
    fg = colors.common.base12,
    bg = colors.common.base13,
  },
  ["NotifyWARNTitle"] = {
    fg = colors.common.base01,
    bg = colors.common.base13,
    bold = true,
  },
  ["NotifyWARNBorder"] = {
    fg = colors.common.base13,
    bg = colors.common.base13,
  },
  ["NotifyDebugBody"] = {
    fg = colors.common.base01,
    bg = colors.common.base15,
  },
  ["NotifyDebugIcon"] = {
    fg = colors.common.base11,
    bg = colors.common.base15,
  },
  ["NotifyDebugTitle"] = {
    fg = colors.common.base01,
    bg = colors.common.base15,
    bold = true,
  },
  ["NotifyDebugBorder"] = {
    fg = colors.common.base15,
    bg = colors.common.base15,
  },
  ["NotifyERRORBody"] = {
    bg = colors.common.base01,
    fg = colors.common.base11,
  },
  ["NotifyERRORIcon"] = {
    fg = colors.common.base08,
    bg = colors.common.base01,
  },
  ["NotifyERRORTitle"] = {
    bg = colors.common.base01,
    fg = colors.common.base11,
    bold = true,
  },
  ["NotifyERRORBorder"] = {
    bg = colors.common.base01,
    fg = colors.common.base01,
  },
  ["NotifyTRACEBody"] = {
    fg = colors.common.base01,
    bg = colors.common.base10,
  },
  ["NotifyTRACEIcon"] = {
    fg = colors.common.base14,
    bg = colors.common.base10,
  },
  ["NotifyTRACETitle"] = {
    fg = colors.common.base01,
    bg = colors.common.base10,
    bold = true,
  },
  ["NotifyTRACEBorder"] = {
    fg = colors.common.base10,
    bg = colors.common.base10,
  },
}

-- vim:ft=lua
