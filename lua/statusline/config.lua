local M = {}

local style = {
  angled = { left = "", right = "", left_alt = "", right_alt = "" },
  rounded = { left = "", right = "", left_alt = "", right_alt = "" },
  slanted = { left = "", right = "", left_alt = "", right_alt = "" },
  square = { left = "█", right = "█", left_alt = "", right_alt = "" },
}

M.mode = {
  style = style.rounded,
  label = 2,
  modes = setmetatable({
    ["n"] = { "NORMAL", "", "NRM" },
    ["no"] = { "NORMAL", "", "NRM" },
    ["v"] = { "VISUAL", "", "VIS" },
    ["V"] = { "V-LINE", "", "VIL" },
    [""] = { "V-BLOCK", "", "VIB" },
    ["s"] = { "SELECT", "", "SET" },
    ["S"] = { "S-LINE", "", "SEL" },
    [""] = { "S-BLOCK", "", "SEB" },
    ["i"] = { "INSERT", "", "INS" },
    ["ic"] = { "INSERT", "", "INS" },
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
  style = style.square,
  absolute = false,
  format = false,
  icon = true,
}

M.dirname = {
  style = style.square,
  icon = "  ",
}

M.treesitter = {
  style = style.square,
  disabled_icon = "  ",
  enabled_icon = " TS לּ  ",
}

M.position = {
  style = style.square,
  icon = true,
  top = " TOP",
  bottom = " BOT",
}

M.lsp = {
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

M.git = {
  style = style.square,
}

M.diagnostics = {
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
