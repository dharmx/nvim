local N = {}

N.common = {
  ["base00"] = "#101317",
  ["base01"] = "#171C21",
  ["base02"] = "#1c2026",
  ["base03"] = "#20252b",

  ["base04"] = "#949494",
  ["base05"] = "#d4d4d5",
  ["base06"] = "#ffffff",

  ["base07"] = "#54ced6",
  ["base08"] = "#70c0ba",
  ["base09"] = "#7ab0df",
  ["base10"] = "#b77ee0",

  ["base11"] = "#f87070",
  ["base12"] = "#36c692",
  ["base13"] = "#ffe59e",
  ["base14"] = "#79dcaa",
  ["base15"] = "#c397d8",
}

N.shades = {
  ["shade00"] = "#3d464e",
  ["shade01"] = "#2b3238",
  ["shade02"] = "#24292e",
  ["shade03"] = "#1f2429",
  ["shade04"] = "#1c2126",
  ["shade05"] = "#191e23",
  ["shade06"] = "#161b20",
  ["shade07"] = "#151a1f",
  ["shade08"] = "#13181d",
  ["shade09"] = "#11161b",
  ["shade10"] = "#0e1115",
  ["shade11"] = "#0c0f13",
  ["shade12"] = "#0a0d11",
}

N.rainbow = {
  ["cobalt"] = "#7ab0df",
  ["pink"] = "#b77ee0",
  ["cyan"] = "#54ced6",
  ["green"] = "#79dcaa",
  ["yellow"] = "#ffe59e",
  ["orange"] = "#f87070",
  ["purple"] = "#c397d8",
}

N.modes = setmetatable({
  ["n"] = "#79dcaa",
  ["no"] = "#79dcaa",
  ["v"] = "#f87070",
  ["V"] = "#b77ee0",
  [""] = "#c397d8",
  ["s"] = "#e87979",
  ["S"] = "#e87979",
  [""] = "#e87979F",
  ["i"] = "#54ced6",
  ["ic"] = "#54ced6",
  ["R"] = "#70c0ba",
  ["Rv"] = "#70c0ba",
  ["c"] = "#ffe59e",
  ["cv"] = "#ffe59e",
  ["ce"] = "#ffe59e",
  ["r"] = "#36c692",
  ["rm"] = "#36c692",
  ["r?"] = "#DE878F",
  ["!"] = "#7ab0df",
  ["t"] = "#7ab0df",
}, {
  __index = function()
    return "#949494"
  end,
})

N.syntax = {
  ["color16"] = "#7ab0df",
  ["color09"] = "#c397d8",

  ["color00"] = "#f87070",
  ["color03"] = "#b77ee0",
  ["color02"] = "#36c692",
  ["color19"] = "#54ced6",

  ["color17"] = "#70c0ba",
  ["color20"] = "#5fb0fc",

  ["color13"] = "#e87979",
  ["color01"] = "#e25656",
  ["color05"] = "#63b3ad",

  ["color12"] = "#79dcaa",
  ["color15"] = "#79dcaa",
  ["color04"] = "#37d99e",

  ["color06"] = "#F186b5",
  ["color08"] = "#e5d487",

  ["color10"] = "#ffe59e",
  ["color11"] = "#ffe59e",

  ["color18"] = "#949494",
  ["color14"] = "#828282",
  ["color07"] = "#d4d4d5",
}

return N

-- vim:ft=lua
