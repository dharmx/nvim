local D = {}

function D.get(colors)
  return {
    ["diffAdded"] = { guifg = colors.common.base14 },
    ["diffRemoved"] = { guifg = colors.common.base11 },
    ["diffChanged"] = { guifg = colors.common.base15 },

    ["diffOldFile"] = { guifg = colors.common.base13 },
    ["diffNewFile"] = { guifg = colors.common.base12 },
    ["diffFile"] = { guifg = colors.common.base07 },

    ["diffLine"] = { guifg = colors.common.base03 },
    ["diffIndexLine"] = { guifg = colors.common.base09 },

    ["DiffAdd"] = { guifg = colors.common.base14 },
    ["DiffChange"] = { guifg = colors.common.base15 },
    ["DiffDelete"] = { guifg = colors.common.base11 },
    ["DiffText"] = { guifg = colors.common.base09 },
  }
end

return D

-- vim:ft=lua
