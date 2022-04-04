local B = {}

function B.get(colors)
  return {
    ["IndentBlanklineChar"] = { foreground = colors.shades.shade02 },
    ["IndentBlanklineContextChar"] = { foreground = colors.common.base10 },
    ["IndentBlanklineContextStart"] = { foreground = colors.common.base10 },
    ["IndentBlanklineSpaceChar"] = { foreground = colors.shades.shades02 },
    ["IndentBlanklineSpaceCharBlankline"] = { foreground = colors.shades.shades02 },
  }
end

return B

-- vim:ft=lua
