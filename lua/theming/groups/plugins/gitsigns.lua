local G = {}

function G.get(colors)
  return {
    ["GitSignsChange"] = { foreground = colors.common.base02 },
    ["GitSignsChangeNr"] = { foreground = colors.common.base15 },
    ["GitSignsChangeLn"] = { foreground = colors.common.base15 },

    ["GitSignsAdd"] = { foreground = colors.common.base09 },
    ["GitSignsAddNr"] = { foreground = colors.common.base14 },
    ["GitSignsAddLn"] = { foreground = colors.common.base14 },

    ["GitSignsDeleteLn"] = { foreground = colors.common.base11 },
    ["GitSignsDelete"] = { foreground = colors.common.base11 },
    ["GitSignsDeleteNr"] = { foreground = colors.common.base11 },
  }
end

return G

-- vim:ft=lua
