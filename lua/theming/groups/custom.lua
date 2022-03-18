local D = {}

function D.get(theme)
  return {
    ["YankFeed"] = { foreground = theme.rainbow.cobalt, decoration = "bold" },
    ["Hidden"] = { foreground = theme.common.base00, background = theme.common.base00 },
    ["LightBulbSign"] = { foreground = theme.common.base13, background = theme.common.base00 },
    ["Default"] = { foreground = "NONE", background = "NONE" },
  }
end

return D

-- vim:ft=lua
