local D = {}

function D.get(theme)
  return {
    DashboardShortCut = { foreground = theme.common.base09, style = "bold" },
    DashboardHeader = { foreground = theme.shades.shade03, decoration = "bold" },
    DashboardCenter = { foreground = theme.common.base11 },
    DashboardFooter = { foreground = theme.common.base01, decoration = "bold" },
  }
end

return D

-- vim:ft=lua
