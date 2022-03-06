local N = {}

N.common = {
  ["base00"] = "#2B3339",
  ["base01"] = "#323C41",
  ["base02"] = "#503946",
  ["base03"] = "#868D80",

  ["base04"] = "#D3C6AA",
  ["base05"] = "#D3C6AA",
  ["base06"] = "#E9E8D2",

  ["base07"] = "#FFF9E8",
  ["base08"] = "#7FBBB3",
  ["base09"] = "#D699B6",
  ["base10"] = "#A7C080",

  ["base11"] = "#E67E80",
  ["base12"] = "#E69875",
  ["base13"] = "#DBBC7F",
  ["base14"] = "#83C092",
  ["base15"] = "#D699B6",
}

N.shades = {
  ["shade00"] = "#5f6350",
  ["shade01"] = "#636050",
  ["shade02"] = "#605847",
  ["shade03"] = "#4e5440",
  ["shade04"] = "#4f4e45",
  ["shade05"] = "#34373A",
  ["shade06"] = "#34393D",
  ["shade07"] = "#272e33",
  ["shade08"] = "#25282b",
  ["shade09"] = "#292f33",
  ["shade10"] = "#25382c",
  ["shade11"] = "#3e4042",
}

N.rainbow = {
  ["cobalt"] = "#D3C6AA",
  ["pink"] = "#E48EAD",
  ["cyan"] = "#67B5B1",
  ["green"] = "#AFBE8C",
  ["yellow"] = "#FFBB8B",
  ["orange"] = "#D08770",
  ["purple"] = "#C090F0",
}

N.modes = setmetatable({
  ["n"] = "#83C092",
  ["no"] = "#83C092",
  ["v"] = "#7FBBB3",
  ["V"] = "#E0AF8B",
  [""] = "#DBA08B",
  ["s"] = "#DE878F",
  ["S"] = "#DE878F",
  [""] = "#DE878F",
  ["i"] = "#C09AE0",
  ["ic"] = "#C09AE0",
  ["R"] = "#D08770",
  ["Rv"] = "#D08770",
  ["c"] = "#BF616A",
  ["cv"] = "#BF616A",
  ["ce"] = "#BF616A",
  ["r"] = "#FFBB8B",
  ["rm"] = "#EBCB8B",
  ["r?"] = "#DE878F",
  ["!"] = "#FFBB8B",
  ["t"] = "#868D80",
}, {
  __index = function()
    return "#D699B6"
  end,
})

N.syntax = {
  ["color16"] = "#7FBBB3",
  ["color09"] = "#8FBCBB",

  ["color00"] = "#E67E80",
  ["color03"] = "#D07E80",
  ["color02"] = "#CF8E80",
  ["color19"] = "#DE878F",

  ["color17"] = "#E67E80",
  ["color20"] = "#E69875",

  ["color13"] = "#EBA08B",
  ["color01"] = "#D0A78F",
  ["color05"] = "#CBA08B",

  ["color12"] = "#83C09F",
  ["color15"] = "#A7C080",
  ["color04"] = "#83C092",

  ["color06"] = "#D699B6",
  ["color08"] = "#D69FCF",

  ["color10"] = "#DBBC7F",
  ["color11"] = "#D3C6AA",

  ["color18"] = "#323C41",
  ["color14"] = "#868D80",
  ["color07"] = "#E9E8D2",
}

return N
