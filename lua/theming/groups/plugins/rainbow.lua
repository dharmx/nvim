local R = {}

function R.get(colors)
  return {
    ["rainbowcol1"] = { guifg = colors.rainbow.cobalt },
    ["rainbowcol2"] = { guifg = colors.rainbow.pink },
    ["rainbowcol3"] = { guifg = colors.rainbow.cyan },
    ["rainbowcol4"] = { guifg = colors.rainbow.green },
    ["rainbowcol5"] = { guifg = colors.rainbow.yellow },
    ["rainbowcol6"] = { guifg = colors.rainbow.orange },
    ["rainbowcol7"] = { guifg = colors.rainbow.purple },
  }
end

return R

-- vim:ft=lua
