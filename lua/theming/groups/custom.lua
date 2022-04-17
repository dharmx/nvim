local D = {}

function D.get(colors)
  return {
    ["YankFeed"] = { guifg = colors.rainbow.cobalt, gui = "bold" },
    ["Hidden"] = { guifg = colors.common.base00, guibg = colors.common.base00 },
    ["LightBulbSign"] = { guifg = colors.common.base13, guibg = colors.common.base00 },
    ["Default"] = { guifg = "NONE", guibg = "NONE" },
  }
end

return D

-- vim:ft=lua
