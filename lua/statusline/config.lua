local M = {}

local style = {
  angled = { left = "", right = "", left_alt = "", right_alt = "" },
  flame = { left = "", right = "", left_alt = "", right_alt = "" },
  rounded = { left = "", right = "", left_alt = "", right_alt = "" },
  slant = { left = "", right = "", left_alt = "", right_alt = "" },
  square = { left = "█", right = "█", left_alt = "", right_alt = "" },
  pacman = { left = "", right = "", left_alt = "", right_alt = "" },
  graphy = { left = "", right = "", left_alt = "", right_alt = "" },
  slantv1 = { left = "", right = "", left_alt = "", right_alt = "" },
  slantv2 = { left = "", right = "", left_alt = "", right_alt = "" },
  slantv3 = { left = "", right = "", left_alt = "", right_alt = "" },
  pixel = { left = "", right = "", left_alt = "", right_alt = "" },
  fullslant = { left = "", right = "", left_alt = "", right_alt = "" },
}

M.mode = {
  truncate = 20,
  style = style.square,
  label = 2,
  modes = setmetatable({
    ["n"] = { "NORMAL", "", "NRM" },
    ["no"] = { "NORMAL", "", "NRM" },
    ["v"] = { "VISUAL", "", "VIS" },
    ["V"] = { "V-LINE", "", "VIL" },
    [""] = { "V-BLOCK", "", "VIB" },
    ["s"] = { "SELECT", "", "SET" },
    ["S"] = { "S-LINE", "ﳝ", "SEL" },
    [""] = { "S-BLOCK", "ﳛ", "SEB" },
    ["i"] = { "INSERT", "", "INS" },
    ["ic"] = { "INSERT", "ﴣ", "INS" },
    ["R"] = { "REPLACE", "", "REP" },
    ["Rv"] = { "V-REPLACE", "", "VRP" },
    ["c"] = { "COMMAND", "", "COM" },
    ["cv"] = { "VI-EX", "", "VEX" },
    ["ce"] = { "EX", "", "EXX" },
    ["r"] = { "PROMPT", "", "PMT" },
    ["rm"] = { "MOAR", "", "MORE" },
    ["r?"] = { "CONFIRM", "", "CNF" },
    ["!"] = { "SHELL", "", "SHL" },
    ["t"] = { "TERMINAL", "", "TRM" },
  }, {
    __index = function()
      return { "UNKNOWN", "", "DEF" }
    end,
  }),
}

M.filename = {
  truncate = 45,
  style = style.square,
  absolute = false,
  format = false,
  icon = true,
}

M.dirname = {
  truncate = 20,
  style = style.square,
  icon = "  ",
}

M.treesitter = {
  truncate = 130,
  style = style.square,
  disabled_icon = "  ",
  enabled_icon = " TS לּ  ",
}

M.position = {
  truncate = 32,
  style = style.square,
  icon = true,
  top = " TOP",
  bottom = " BOT",
}

M.lsp = {
  truncate = 80,
  style = style.square,
  spinners = {
    success = {
      "",
      "",
      "",
    },
    loading = {
      "",
      "",
      "",
      "",
    },
  },
  short = true,
}

M.lightbulb = {
  truncate = 85,
  style = style.square,
}

M.git = {
  truncate = 70,
  style = style.square,
  short = false,
}

M.diagnostics = {
  truncate = 63,
  severities = {
    ERROR = "",
    WARN = "",
    INFO = "",
    HINT = "",
  },
  style = style.square,
}

return M

-- vim:ft=lua
