local T = {}

function T.get(colors)
  return {
    ["TodoBgFIX"] = { background = colors.common.base13, foreground = colors.common.base01 },
    ["TodoBgHACK"] = { background = colors.common.base12, foreground = colors.common.base01 },
    ["TodoBgNOTE"] = { background = colors.common.base14, foreground = colors.common.base01 },
    ["TodoBgPERF"] = { background = colors.common.base09, foreground = colors.common.base01 },
    ["TodoBgTODO"] = { background = colors.common.base15, foreground = colors.common.base01 },
    ["TodoBgWARN"] = { background = colors.common.base11, foreground = colors.common.base01 },
    ["TodoBgIMPROVE"] = { background = colors.common.base07, foreground = colors.common.base01 },

    ["TodoFgFIX"] = { foreground = colors.common.base13 },
    ["TodoFgHACK"] = { foreground = colors.common.base12 },
    ["TodoFgNOTE"] = { foreground = colors.common.base14 },
    ["TodoFgPERF"] = { foreground = colors.common.base09 },
    ["TodoFgTODO"] = { foreground = colors.common.base15 },
    ["TodoFgWARN"] = { foreground = colors.common.base11 },
    ["TodoFgIMPROVE"] = { foreground = colors.common.base07 },

    ["TodoSignFIX"] = { foreground = colors.common.base13 },
    ["TodoSignHACK"] = { foreground = colors.common.base12 },
    ["TodoSignNOTE"] = { foreground = colors.common.base14 },
    ["TodoSignPERF"] = { foreground = colors.common.base09 },
    ["TodoSignTODO"] = { foreground = colors.common.base15 },
    ["TodoSignWARN"] = { foreground = colors.common.base11 },
    ["TodoSignIMPROVE"] = { foreground = colors.common.base07 },
  }
end

return T

-- vim:ft=lua
