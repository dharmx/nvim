local R = {}

function R.get(theme)
  return {
    ["rainbowcol1"] = { foreground = theme.rainbow.cobalt },
    ["rainbowcol2"] = { foreground = theme.rainbow.pink },
    ["rainbowcol3"] = { foreground = theme.rainbow.cyan },
    ["rainbowcol4"] = { foreground = theme.rainbow.green },
    ["rainbowcol5"] = { foreground = theme.rainbow.yellow },
    ["rainbowcol6"] = { foreground = theme.rainbow.orange },
    ["rainbowcol7"] = { foreground = theme.rainbow.purple },
  }
end

return R

-- vim:ft=lua
