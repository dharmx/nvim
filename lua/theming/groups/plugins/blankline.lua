return {
  setup = function(colors)
    hi("IndentBlanklineChar", { guifg = colors.shades.shade02 })
    hi("IndentBlanklineContextChar", { guifg = colors.common.base10 })
    hi("IndentBlanklineContextStart", { guifg = colors.common.base10 })
    hi("IndentBlanklineSpaceChar", { guifg = colors.shades.shade02 })
    hi("IndentBlanklineSpaceCharBlankline", { guifg = colors.shades.shade02 })
  end,
}

-- vim:ft=lua
