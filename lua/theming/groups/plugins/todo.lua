local T = {}

function T.get(colors)
  return {
    ["TodoBgFIX"] = { guibg = colors.common.base13, guifg = colors.common.base01 },
    ["TodoBgHACK"] = { guibg = colors.common.base12, guifg = colors.common.base01 },
    ["TodoBgNOTE"] = { guibg = colors.common.base14, guifg = colors.common.base01 },
    ["TodoBgPERF"] = { guibg = colors.common.base09, guifg = colors.common.base01 },
    ["TodoBgTODO"] = { guibg = colors.common.base15, guifg = colors.common.base01 },
    ["TodoBgWARN"] = { guibg = colors.common.base11, guifg = colors.common.base01 },
    ["TodoBgIMPROVE"] = { guibg = colors.common.base07, guifg = colors.common.base01 },
    ["TodoBgCLEAN"] = { guibg = colors.common.base11, guifg = colors.common.base01 },
    ["TodoBgWANTS"] = { guibg = colors.common.base12, guifg = colors.common.base01 },
    ["TodoBgCHORE"] = { guibg = colors.common.base13, guifg = colors.common.base01 },
    ["TodoBgUPDATE"] = { guibg = colors.common.base15, guifg = colors.common.base01 },

    ["TodoFgFIX"] = { guifg = colors.common.base13 },
    ["TodoFgHACK"] = { guifg = colors.common.base12 },
    ["TodoFgNOTE"] = { guifg = colors.common.base14 },
    ["TodoFgPERF"] = { guifg = colors.common.base09 },
    ["TodoFgTODO"] = { guifg = colors.common.base15 },
    ["TodoFgWARN"] = { guifg = colors.common.base11 },
    ["TodoFgIMPROVE"] = { guifg = colors.common.base07 },
    ["TodoFgCLEAN"] = { guifg = colors.common.base11 },
    ["TodoFgUPDATE"] = { guifg = colors.common.base15 },
    ["TodoFgCHORE"] = { guifg = colors.common.base13 },
    ["TodoFgWANTS"] = { guifg = colors.common.base12 },

    ["TodoSignFIX"] = { guifg = colors.common.base13 },
    ["TodoSignHACK"] = { guifg = colors.common.base12 },
    ["TodoSignNOTE"] = { guifg = colors.common.base14 },
    ["TodoSignPERF"] = { guifg = colors.common.base09 },
    ["TodoSignTODO"] = { guifg = colors.common.base15 },
    ["TodoSignWARN"] = { guifg = colors.common.base11 },
    ["TodoSignIMPROVE"] = { guifg = colors.common.base08 },
    ["TodoSignWANTS"] = { guifg = colors.common.base12 },
    ["TodoSignUPDATE"] = { guifg = colors.common.base13 },
    ["TodoSignCHORE"] = { guifg = colors.common.base14 },
    ["TodoSignCLEAN"] = { guifg = colors.common.base15 },
  }
end

return T

-- vim:ft=lua
