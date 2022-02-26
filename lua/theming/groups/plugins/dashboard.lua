local D = {}

function D.get(theme)
  return {
    DashboardShortCut = { foreground = theme.common.base11, style = "bold" },
    DashboardHeader = { foreground = theme.common.base09, decoration = "bold" },
    DashboardCenter = { foreground = theme.common.base14 },
    DashboardFooter = { foreground = theme.common.base12, decoration = "bold" },
  }
end

return D
