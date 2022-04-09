local D = {}

function D.get(colors)
  return {
    ["YankFeed"] = { foreground = colors.rainbow.cobalt, decoration = "bold" },
    ["Hidden"] = { foreground = colors.common.base00, background = colors.common.base00 },
    ["LightBulbSign"] = { foreground = colors.common.base13, background = colors.common.base00 },
    ["Default"] = { foreground = "NONE", background = "NONE" },
  }
end

return D

-- vim:ft=lua
