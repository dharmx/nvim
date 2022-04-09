local D = {}

function D.get(colors)
  return {
    ["diffAdded"] = { foreground = colors.common.base14 },
    ["diffRemoved"] = { foreground = colors.common.base11 },
    ["diffChanged"] = { foreground = colors.common.base15 },

    ["diffOldFile"] = { foreground = colors.common.base13 },
    ["diffNewFile"] = { foreground = colors.common.base12 },
    ["diffFile"] = { foreground = colors.common.base07 },

    ["diffLine"] = { foreground = colors.common.base03 },
    ["diffIndexLine"] = { foreground = colors.common.base09 },

    ["DiffAdd"] = { foreground = colors.common.base14 },
    ["DiffChange"] = { foreground = colors.common.base15 },
    ["DiffDelete"] = { foreground = colors.common.base11 },
    ["DiffText"] = { foreground = colors.common.base09 },
  }
end

return D

-- vim:ft=lua
