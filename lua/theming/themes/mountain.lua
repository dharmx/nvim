local N = {}

N.common = {
  ["base00"] = "#1a2026",
  ["base01"] = "#21272d",
  ["base02"] = "#292f35",
  ["base03"] = "#2e343a",
  ["base04"] = "#42484e",
  ["base05"] = "#bebebe",
  ["base06"] = "#bbbbbb",
  ["base07"] = "#b0b0b0",
  ["base08"] = "#ac8a8c",
  ["base09"] = "#C9938A",
  ["base10"] = "#aca98a",
  ["base11"] = "#8aac8b",
  ["base12"] = "#8aabac",
  ["base13"] = "#7797b7",
  ["base14"] = "#948fb1",
  ["base15"] = "#ac8a8c",
}

N.shades = {
  ["shade00"] = "#565c62",
  ["shade01"] = "#50565c",
  ["shade02"] = "#474d53",
  ["shade03"] = "#42484e",
  ["shade04"] = "#2e343a",
  ["shade05"] = "#292f35",
  ["shade06"] = "#242a30",
  ["shade07"] = "#20262c",
  ["shade08"] = "#212528",
  ["shade09"] = "#1c2023",
  ["shade10"] = "#151b21",
  ["shade11"] = "#161a1d",
  ["shade12"] = "#14181b",
}

N.rainbow = {
  ["cobalt"] = "#7ea4c9",
  ["pink"] = "#cc707d",
  ["cyan"] = "#87c6a7",
  ["green"] = "#77ad9F",
  ["yellow"] = "#c9a47e",
  ["orange"] = "#e28e6a",
  ["purple"] = "#ad8cce",
}

N.modes = setmetatable({
  ["n"] = "#95aec7",
  ["no"] = "#7ea4c9",
  ["v"] = "#ad8cce",
  ["V"] = "#ae95c7",
  [""] = "#c187a4",
  ["s"] = "#e0987f",
  ["S"] = "#e0987f",
  [""] = "#e28e6a",
  ["i"] = "#aec795",
  ["ic"] = "#aec795",
  ["R"] = "#95c7ae",
  ["Rv"] = "#95c7ae",
  ["c"] = "#ae95c7",
  ["cv"] = "#ad8cce",
  ["ce"] = "#ad8cce",
  ["r"] = "#cc707d",
  ["rm"] = "#cc707d",
  ["r?"] = "#cc707d",
  ["!"] = "#c187a4",
  ["t"] = "#c187a4",
}, {
  __index = function()
    return "#cbd0d5"
  end,
})

N.syntax = {
  ["color16"] = "#9aafe6",
  ["color09"] = "#a39ec4",

  ["color00"] = "#c795ae",
  ["color03"] = "#8f8aac",
  ["color02"] = "#9ec49f",
  ["color19"] = "#8aac8b",

  ["color17"] = "#70b2a0",
  ["color20"] = "#7d9fc1",

  ["color13"] = "#e0987f",
  ["color01"] = "#cc707d",
  ["color05"] = "#ae9FcF",

  ["color12"] = "#b8d19f",
  ["color15"] = "#b1ca98",
  ["color04"] = "#aec795",

  ["color06"] = "#c795ae",
  ["color08"] = "#c4c19e",

  ["color10"] = "#aca98a",
  ["color11"] = "#c7ae95",

  ["color18"] = "#cbd0d5",
  ["color14"] = "#747c84",
  ["color07"] = "#c7ccd1",
}

return N

-- vim:ft=lua
