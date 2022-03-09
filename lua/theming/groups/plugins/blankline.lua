local B = {}

function B.get(theme)
  return {
    ["IndentBlanklineChar"] = { foreground = theme.shades.shade02 },
    ["IndentBlanklineContextChar"] = { foreground = theme.common.base10 },
    ["IndentBlanklineContextStart"] = { foreground = theme.common.base10 },
    ["IndentBlanklineSpaceChar"] = { foreground = theme.shades.shades02 },
    ["IndentBlanklineSpaceCharBlankline"] = { foreground = theme.shades.shades02 },
  }
end

return B

-- vim:ft=lua
