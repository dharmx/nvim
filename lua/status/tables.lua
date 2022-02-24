local T = {}
local colors = require("highlights.schemes." .. vim.g.current_scheme)

T.modes = setmetatable({
  ["n"] = { style = { "NORMAL", "", "NRM" }, color = colors.modes["n"] },
  ["no"] = { style = { "NORMAL", "﯈", "NRM" }, color = colors.modes["no"] },
  ["v"] = { style = { "VISUAL", "", "VIS" }, color = colors.modes["v"] },
  ["V"] = { style = { "V-LINE", "", "VIL" }, color = colors.modes["V"] },
  [""] = { style = { "V-BLOCK", "", "VIB" }, color = colors.modes[""] },
  ["s"] = { style = { "SELECT", "", "SET" }, color = colors.modes["s"] },
  ["S"] = { style = { "S-LINE", "", "SEL" }, color = colors.modes["S"] },
  [""] = { style = { "S-BLOCK", "", "SEB" }, color = colors.modes[""] },
  ["i"] = { style = { "INSERT", "", "INS" }, color = colors.modes["i"] },
  ["ic"] = { style = { "INSERT", "", "INS" }, color = colors.modes["ic"] },
  ["R"] = { style = { "REPLACE", "", "REP" }, color = colors.modes["R"] },
  ["Rv"] = { style = { "V-REPLACE", "", "VRP" }, color = colors.modes["Rv"] },
  ["c"] = { style = { "COMMAND", "", "COM" }, color = colors.modes["c"] },
  ["cv"] = { style = { "VI-EX", "", "VEX" }, color = colors.modes["cv"] },
  ["ce"] = { style = { "EX", "", "EXX" }, color = colors.modes["ce"] },
  ["r"] = { style = { "PROMPT", "", "PMT" }, color = colors.modes["r"] },
  ["rm"] = { style = { "MOAR", "", "MORE" }, color = colors.modes["rm"] },
  ["r?"] = { style = { "CONFIRM", "", "CNF" }, color = colors.modes["r?"] },
  ["!"] = { style = { "SHELL", "", "SHL" }, color = colors.modes["!"] },
  ["t"] = { style = { "TERMINAL", "", "TRM" }, color = colors.modes["t"] },
}, {
  __index = function()
    return { style = { "UNKNOWN", "", "DEF" }, color = colors.modes["u"] }
  end,
})

T.separators = {
  angled = { left = "", right = "" },
  rounded = { left = "", right = "" },
  slanted = { left = "", right = "" },
}

T.truncate = setmetatable({ mode = 15 }, {
  __index = function()
    return 5
  end,
})

T.hidden = {
  "dashboard",
  "packer",
  "NvimTree",
  "Outline",
  "lsp-installer",
  "TelescopePrompt",
  "help",
  "telescope",
  "lspinfo",
  "Trouble",
  "terminal",
  "null-ls-info",
}

return T
