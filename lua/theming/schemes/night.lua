local N = {}

N.common = {
  -- Polar Night
  ["base00"] = "#101317",
  ["base01"] = "#23242A",
  ["base02"] = "#27282d",
  ["base03"] = "#38393f",

  -- Snowy Storm
  ["base04"] = "#dddddd",
  ["base05"] = "#d4d4d5",
  ["base06"] = "#ffffff",

  -- Frost
  ["base07"] = "#54ced6",
  ["base08"] = "#70c0ba",
  ["base09"] = "#7ab0df",
  ["base10"] = "#b77ee0",

  -- Aurora
  ["base11"] = "#f87070",
  ["base12"] = "#36c692",
  ["base13"] = "#ffe59e",
  ["base14"] = "#79dcaa",
  ["base15"] = "#c397d8",
}

N.shades = {
  ["shade00"] = "#505763",
  ["shade01"] = "#505A63",
  ["shade02"] = "#484d61",
  ["shade03"] = "#1f1f23",
  ["shade04"] = "#333947",
  ["shade05"] = "#1c1c1e",
  ["shade06"] = "#19191c",
  ["shade07"] = "#2e333d",
  ["shade08"] = "#1a1a1c",
  ["shade09"] = "#151519",
  ["shade10"] = "#252B37",
  ["shade11"] = "#262c38",
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
  ["s"] = "#CE878F",
  ["S"] = "#CE878F",
  [""] = "#CE878F",
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
  ["color20"] = "#619acc",

  ["color13"] = "#d66f6f",
  ["color01"] = "#e25656",
  ["color05"] = "#aa5050",

  ["color12"] = "#79dcaa",
  ["color15"] = "#79dcaa",
  ["color04"] = "#7dcea6",

  ["color06"] = "#5186b5",
  ["color08"] = "#eac767",

  ["color10"] = "#ffe59e",
  ["color11"] = "#ffe59e",

  ["color18"] = "#949494",
  ["color14"] = "#828282",
  ["color07"] = "#d4d4d5",
}

return N

-- vim:ft=lua
