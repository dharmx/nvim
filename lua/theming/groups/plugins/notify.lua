local B = {}

function B.get(theme)
  return {
    ["NotifyINFOBody"] = { background = theme.shades.shade08, foreground = theme.common.base09 },
    ["NotifyINFOBody2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOBorder"] = { background = theme.shades.shade08, foreground = theme.shades.shade08 },
    ["NotifyINFOBorder2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOIcon"] = { foreground = theme.common.base15 },
    ["NotifyINFOIcon2"] = { foreground = theme.common.base09 },
    ["NotifyINFOTitle"] = { foreground = theme.common.base08, decoration = "bold" },
    ["NotifyINFOTitle2"] = { foreground = theme.common.base08, decoration = "bold" },

    ["NotifyLogTime"] = { foreground = theme.common.base08, decoration = "bold" },
    ["NotifyLogTitle"] = { foreground = theme.common.base08, decoration = "bold" },

    ["NotifyWARNBody"] = { foreground = theme.common.base01, background = theme.common.base13 },
    ["NotifyWARNIcon"] = { foreground = theme.common.base12, background = theme.common.base13 },
    ["NotifyWARNTitle"] = { foreground = theme.common.base01, background = theme.common.base13, decoration = "bold" },
    ["NotifyWARNBorder"] = { foreground = theme.common.base13, background = theme.common.base13 },

    ["NotifyDebugBody"] = { foreground = theme.common.base01, background = theme.common.base15 },
    ["NotifyDebugIcon"] = { foreground = theme.common.base11, background = theme.common.base15 },
    ["NotifyDebugTitle"] = { foreground = theme.common.base01, background = theme.common.base15, decoration = "bold" },
    ["NotifyDebugBorder"] = { foreground = theme.common.base15, background = theme.common.base15 },

    ["NotifyERRORBody"] = { foreground = theme.common.base01, background = theme.common.base11 },
    ["NotifyERRORIcon"] = { foreground = theme.common.base08, background = theme.common.base11 },
    ["NotifyERRORTitle"] = { foreground = theme.common.base01, background = theme.common.base11, decoration = "bold" },
    ["NotifyERRORBorder"] = { foreground = theme.common.base11, background = theme.common.base11 },

    ["NotifyTRACEBody"] = { foreground = theme.common.base01, background = theme.common.base10 },
    ["NotifyTRACEIcon"] = { foreground = theme.common.base14, background = theme.common.base10 },
    ["NotifyTRACETitle"] = { foreground = theme.common.base01, background = theme.common.base10, decoration = "bold" },
    ["NotifyTRACEBorder"] = { foreground = theme.common.base10, background = theme.common.base10 },
  }
end

return B

-- vim:ft=lua
