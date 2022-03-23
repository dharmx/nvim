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
  style = style.fullslant,
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
  style = style.fullslant,
  absolute = false,
  format = false,
  icon = true,
}

M.dirname = {
  style = style.fullslant,
  icon = "  ",
}

M.treesitter = {
  style = style.fullslant,
  disabled_icon = "  ",
  enabled_icon = " TS לּ  ",
}

M.position = {
  style = style.fullslant,
  icon = true,
  top = " TOP",
  bottom = " BOT",
}

M.lsp = {
  style = style.fullslant,
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

M.git = {
  style = style.fullslant,
}

M.diagnostics = {
  severities = {
    ERROR = "",
    WARN = "",
    INFO = "",
    HINT = "",
  },
  style = style.fullslant,
}

return M

-- vim:ft=lua
