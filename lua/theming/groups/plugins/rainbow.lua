local R = {}

function R.get(colors)
  return {
    ["rainbowcol1"] = { foreground = colors.rainbow.cobalt },
    ["rainbowcol2"] = { foreground = colors.rainbow.pink },
    ["rainbowcol3"] = { foreground = colors.rainbow.cyan },
    ["rainbowcol4"] = { foreground = colors.rainbow.green },
    ["rainbowcol5"] = { foreground = colors.rainbow.yellow },
    ["rainbowcol6"] = { foreground = colors.rainbow.orange },
    ["rainbowcol7"] = { foreground = colors.rainbow.purple },
  }
end

return R

-- vim:ft=lua
