local B = {}

function B.get(colors)
  return {
    ["NotifyINFOBody"] = { background = colors.shades.shade08, foreground = colors.common.base09 },
    ["NotifyINFOBody2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOBorder"] = { background = colors.shades.shade08, foreground = colors.shades.shade08 },
    ["NotifyINFOBorder2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOIcon"] = { foreground = colors.common.base15 },
    ["NotifyINFOIcon2"] = { foreground = colors.common.base09 },
    ["NotifyINFOTitle"] = { foreground = colors.common.base08, decoration = "bold" },
    ["NotifyINFOTitle2"] = { foreground = colors.common.base08, decoration = "bold" },

    ["NotifyLogTime"] = { foreground = colors.common.base08, decoration = "bold" },
    ["NotifyLogTitle"] = { foreground = colors.common.base08, decoration = "bold" },

    ["NotifyWARNBody"] = { foreground = colors.common.base01, background = colors.common.base13 },
    ["NotifyWARNIcon"] = { foreground = colors.common.base12, background = colors.common.base13 },
    ["NotifyWARNTitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base13,
      decoration = "bold",
    },
    ["NotifyWARNBorder"] = { foreground = colors.common.base13, background = colors.common.base13 },

    ["NotifyDebugBody"] = { foreground = colors.common.base01, background = colors.common.base15 },
    ["NotifyDebugIcon"] = { foreground = colors.common.base11, background = colors.common.base15 },
    ["NotifyDebugTitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base15,
      decoration = "bold",
    },
    ["NotifyDebugBorder"] = { foreground = colors.common.base15, background = colors.common.base15 },

    ["NotifyERRORBody"] = { foreground = colors.common.base01, background = colors.common.base11 },
    ["NotifyERRORIcon"] = { foreground = colors.common.base08, background = colors.common.base11 },
    ["NotifyERRORTitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base11,
      decoration = "bold",
    },
    ["NotifyERRORBorder"] = { foreground = colors.common.base11, background = colors.common.base11 },

    ["NotifyTRACEBody"] = { foreground = colors.common.base01, background = colors.common.base10 },
    ["NotifyTRACEIcon"] = { foreground = colors.common.base14, background = colors.common.base10 },
    ["NotifyTRACETitle"] = {
      foreground = colors.common.base01,
      background = colors.common.base10,
      decoration = "bold",
    },
    ["NotifyTRACEBorder"] = { foreground = colors.common.base10, background = colors.common.base10 },
  }
end

return B

-- vim:ft=lua
