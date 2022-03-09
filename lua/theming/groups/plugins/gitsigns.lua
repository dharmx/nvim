local G = {}

function G.get(theme)
  return {
    ["GitSignsChange"] = { foreground = theme.common.base15 },
    ["GitSignsChangeNr"] = { foreground = theme.common.base15 },
    ["GitSignsChangeLn"] = { foreground = theme.common.base15 },

    ["GitSignsAdd"] = { foreground = theme.common.base14 },
    ["GitSignsAddNr"] = { foreground = theme.common.base14 },
    ["GitSignsAddLn"] = { foreground = theme.common.base14 },

    ["GitSignsDeleteLn"] = { foreground = theme.common.base11 },
    ["GitSignsDelete"] = { foreground = theme.common.base11 },
    ["GitSignsDeleteNr"] = { foreground = theme.common.base11 },
  }
end

return G

-- vim:ft=lua
