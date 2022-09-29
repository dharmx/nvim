local N = {}

N.common = {
  -- Polar Night
  ["base00"] = "#2E3440",
  ["base01"] = "#3B4252",
  ["base02"] = "#434C5E",
  ["base03"] = "#4C566A",

  -- Snowy Storm
  ["base04"] = "#D8DEE9",
  ["base05"] = "#E5E9F0",
  ["base06"] = "#ECEFF4",

  -- Frost
  ["base07"] = "#8FBCBB",
  ["base08"] = "#88C0D0",
  ["base09"] = "#81A1C1",
  ["base10"] = "#5E81AC",

  -- Aurora
  ["base11"] = "#BF616A",
  ["base12"] = "#D08770",
  ["base13"] = "#EBCB8B",
  ["base14"] = "#A3BE8C",
  ["base15"] = "#B48EAD",
}

N.shades = {
  ["shade00"] = "#505763",
  ["shade01"] = "#505A63",
  ["shade02"] = "#484d61",
  ["shade03"] = "#414754",
  ["shade04"] = "#333947",
  ["shade05"] = "#393f4C",
  ["shade06"] = "#333947",
  ["shade07"] = "#2e333d",
  ["shade08"] = "#292e39",
  ["shade09"] = "#252A33",
  ["shade10"] = "#252B37",
  ["shade11"] = "#262c38",
  ["shade12"] = "#242a36",
}

N.rainbow = {
  ["cobalt"] = "#AFC2E5",
  ["pink"] = "#C48EAD",
  ["cyan"] = "#DDBBB1",
  ["green"] = "#AFBE8C",
  ["yellow"] = "#FFBB8B",
  ["orange"] = "#D08770",
  ["purple"] = "#C0A0F0",
}

N.modes = setmetatable({
  ["n"] = "#88C0D0",
  ["no"] = "#88C0D0",
  ["v"] = "#A3BE8C",
  ["V"] = "#E0AF8B",
  [""] = "#DBA08B",
  ["s"] = "#CE878F",
  ["S"] = "#de878f",
  [""] = "#de878f",
  ["i"] = "#C09AC0",
  ["ic"] = "#C09AC0",
  ["R"] = "#D08770",
  ["Rv"] = "#D08770",
  ["c"] = "#BF616A",
  ["cv"] = "#BF616A",
  ["ce"] = "#BF616A",
  ["r"] = "#DFBB8B",
  ["rm"] = "#EBCB8B",
  ["r?"] = "#DE878F",
  ["!"] = "#DFBF8B",
  ["t"] = "#5E81AC",
}, {
  __index = function()
    return "#B48EAD"
  end,
})

N.syntax = {
  ["color16"] = "#88C0D0",
  ["color09"] = "#8FBCBB",

  ["color00"] = "#81A1C1",
  ["color03"] = "#7797B7",
  ["color02"] = "#6F8EAD",
  ["color19"] = "#5E81AC",

  ["color17"] = "#BF616A",
  ["color20"] = "#D08770",

  ["color13"] = "#C08770",
  ["color01"] = "#de878f",
  ["color05"] = "#de878f",

  ["color12"] = "#AFBE8C",
  ["color15"] = "#A3BE8C",
  ["color04"] = "#99BB8B",

  ["color06"] = "#B48EAD",
  ["color08"] = "#B08F90",

  ["color10"] = "#EBCB8B",
  ["color11"] = "#EBCBAB",

  ["color18"] = "#333947",
  ["color14"] = "#434C5E",
  ["color07"] = "#D8DEE9",
}

return N

-- vim:ft=lua
