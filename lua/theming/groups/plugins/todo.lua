local T = {}

function T.get(theme)
  return {
    ["TodoBgFIX"] = { background = theme.common.base13, foreground = theme.common.base01 },
    ["TodoBgHACK"] = { background = theme.common.base12, foreground = theme.common.base01 },
    ["TodoBgNOTE"] = { background = theme.common.base14, foreground = theme.common.base01 },
    ["TodoBgPERF"] = { background = theme.common.base09, foreground = theme.common.base01 },
    ["TodoBgTODO"] = { background = theme.common.base15, foreground = theme.common.base01 },
    ["TodoBgWARN"] = { background = theme.common.base11, foreground = theme.common.base01 },

    ["TodoFgFIX"] = { foreground = theme.common.base13 },
    ["TodoFgHACK"] = { foreground = theme.common.base12 },
    ["TodoFgNOTE"] = { foreground = theme.common.base14 },
    ["TodoFgPERF"] = { foreground = theme.common.base09 },
    ["TodoFgTODO"] = { foreground = theme.common.base15 },
    ["TodoFgWARN"] = { foreground = theme.common.base11 },

    ["TodoSignFIX"] = { foreground = theme.common.base13 },
    ["TodoSignHACK"] = { foreground = theme.common.base12 },
    ["TodoSignNOTE"] = { foreground = theme.common.base14 },
    ["TodoSignPERF"] = { foreground = theme.common.base09 },
    ["TodoSignTODO"] = { foreground = theme.common.base15 },
    ["TodoSignWARN"] = { foreground = theme.common.base11 },
  }
end

return T

-- vim:ft=lua
