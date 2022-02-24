local D = {}

function D.get(theme)
  return {
    diffAdded = { foreground = theme.common.base14 },
    diffRemoved = { foreground = theme.common.base11 },
    diffChanged = { foreground = theme.common.base15 },

    diffOldFile = { foreground = theme.common.base13 },
    diffNewFile = { foreground = theme.common.base12 },
    diffFile = { foreground = theme.common.base07 },

    diffLine = { foreground = theme.common.base03 },
    diffIndexLine = { foreground = theme.common.base09 },

    DiffAdd = { foreground = theme.common.base14 },
    DiffChange = { foreground = theme.common.base15 },
    DiffDelete = { foreground = theme.common.base11 },
    DiffText = { foreground = theme.common.base09 },
  }
end

return D
