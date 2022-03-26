local M = {}

local style = {
  angled = { left = "", right = "", left_alt = "", right_alt = "" },
  flame = { left = "", right = "", left_alt = "", right_alt = "" },
  rounded = { left = "", right = "", left_alt = "", right_alt = "" },
  slant = { left = "", right = "", left_alt = "", right_alt = "" },
  square = { left = "█", right = "█", left_alt = "", right_alt = "" },
  xsquare = { left = "█", right = "█", left_alt = "█", right_alt = "█" },
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
  style = style.xsquare,
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
  style = style.xsquare,
  absolute = false,
  format = false,
  icon = true,
  modified = " ",
  readonly = " ",
  modifiable = " ",
}

M.dirname = {
  truncate = 20,
  style = style.xsquare,
  icon = "  ",
}

M.treesitter = {
  truncate = 130,
  style = style.xsquare,
  disabled_icon = " ﮤ ",
  enabled_icon = " TS לּ  ",
}

M.position = {
  truncate = 32,
  style = style.xsquare,
  icon = true,
  spinners = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  },
  top = " TOP",
  bottom = " BOT",
  extra = " ",
}

M.lsp = {
  truncate = 80,
  style = style.xsquare,
  spinners = {
    success = {
      "",
      "",
      "",
    },
    loading = {
      "",
      "",
      "",
      "",
      "",
    },
  },
  short = true,
  label = " LSP",
}

M.lightbulb = {
  truncate = 85,
  style = style.xsquare,
  unavailable = " ",
  active = " ",
  loading = " ",
}

M.git = {
  truncate = 70,
  style = style.xsquare,
  short = false,
  branch = "  ",
  main = "  ",
  added = "  ",
  removed = "  ",
  changed = "  ",
}

M.diagnostics = {
  truncate = 63,
  severities = {
    ERROR = "",
    WARN = "",
    INFO = "",
    HINT = "",
  },
  style = style.xsquare,
}

return M

-- vim:ft=lua
