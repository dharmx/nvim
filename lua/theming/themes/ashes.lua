local N = {}

N.common = {
  ["base00"] = "#1c2023",
  ["base01"] = "#202427",
  ["base02"] = "#24282b",
  ["base03"] = "#292d30",

  ["base04"] = "#c7ccd1",
  ["base05"] = "#cbd0d5",
  ["base06"] = "#f3f4f5",

  ["base07"] = "#95c7ae",
  ["base08"] = "#95aec7",
  ["base09"] = "#ae95c7",
  ["base10"] = "#c795ae",

  ["base11"] = "#e07f8e",
  ["base12"] = "#e0987f",
  ["base13"] = "#c7ae95",
  ["base14"] = "#aec795",
  ["base15"] = "#c187a4",
}

N.shades = {
  ["shade00"] = "#3e4245",
  ["shade01"] = "#3b3f42",
  ["shade02"] = "#3b3f42",
  ["shade03"] = "#383c3f",
  ["shade04"] = "#35393c",
  ["shade05"] = "#303437",
  ["shade06"] = "#2b2f32",
  ["shade07"] = "#262a2d",
  ["shade08"] = "#212528",
  ["shade09"] = "#1d2124",
  ["shade10"] = "#181c1f",
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
  ["color16"] = "#95aec7",
  ["color09"] = "#ae95c7",

  ["color00"] = "#c795ae",
  ["color03"] = "#ae95c7",
  ["color02"] = "#87c6a7",
  ["color19"] = "#77ad9F",

  ["color17"] = "#70b2a0",
  ["color20"] = "#7d9fc1",

  ["color13"] = "#e0987f",
  ["color01"] = "#cc707d",
  ["color05"] = "#ae9FcF",

  ["color12"] = "#b8d19f",
  ["color15"] = "#b1ca98",
  ["color04"] = "#aec795",

  ["color06"] = "#c795ae",
  ["color08"] = "#c9a27a",

  ["color10"] = "#c7ae95",
  ["color11"] = "#c7ae95",

  ["color18"] = "#cbd0d5",
  ["color14"] = "#747c84",
  ["color07"] = "#c7ccd1",
}

return N

-- vim:ft=lua
