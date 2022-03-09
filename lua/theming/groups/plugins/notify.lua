local B = {}

function B.get(theme)
  return {
    ["NotifyINFOBody"] = { background = theme.shades.shade04, foreground = theme.common.base09 },
    ["NotifyINFOBody2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOBorder"] = { background = theme.shades.shade04, foreground = theme.shades.shade04 },
    ["NotifyINFOBorder2"] = { link = "NotifyINFOBody" },
    ["NotifyINFOIcon"] = { foreground = theme.common.base15 },
    ["NotifyINFOIcon2"] = { foreground = theme.common.base09 },
    ["NotifyINFOTitle"] = { foreground = theme.common.base08, decoration = "bold" },
    ["NotifyINFOTitle2"] = { foreground = theme.common.base08, decoration = "bold" },
  }
end

return B

-- vim:ft=lua
