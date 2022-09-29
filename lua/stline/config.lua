--- STL config file

local M = {}

M.MAIN = {
  left = "",
  right = "",
  floating = false,
}

-- STL mode symbols
-- options: glyphs, full mode name, short mode name
M.mode = {
  truncate = 20,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  label = 2,
  modes = setmetatable({
    ["n"] = {
      "NORMAL",
      "",
      "NRM",
    },
    ["no"] = {
      "NORMAL",
      "",
      "NRM",
    },
    ["v"] = {
      "VISUAL",
      "",
      "VIS",
    },
    ["V"] = {
      "V-LINE",
      "",
      "VIL",
    },
    [""] = {
      "V-BLOCK",
      "",
      "VIB",
    },
    ["s"] = {
      "SELECT",
      "",
      "SET",
    },
    ["S"] = {
      "S-LINE",
      "ﳝ",
      "SEL",
    },
    [""] = {
      "S-BLOCK",
      "ﳛ",
      "SEB",
    },
    ["i"] = {
      "INSERT",
      "",
      "INS",
    },
    ["ic"] = {
      "INSERT",
      "ﴣ",
      "INS",
    },
    ["R"] = {
      "REPLACE",
      "",
      "REP",
    },
    ["Rv"] = {
      "V-REPLACE",
      "",
      "VRP",
    },
    ["c"] = {
      "COMMAND",
      "",
      "COM",
    },
    ["cv"] = {
      "VI-EX",
      "",
      "VEX",
    },
    ["ce"] = {
      "EX",
      "",
      "EXX",
    },
    ["r"] = {
      "PROMPT",
      "",
      "PMT",
    },
    ["rm"] = {
      "MOAR",
      "",
      "MORE",
    },
    ["r?"] = {
      "CONFIRM",
      "",
      "CNF",
    },
    ["!"] = {
      "SHELL",
      "",
      "SHL",
    },
    ["t"] = {
      "TERMINAL",
      "",
      "TRM",
    },
  }, {
    __index = function()
      return {
        "UNKNOWN",
        "",
        "DEF",
      }
    end,
  }),
}

-- filename module sub-config
M.filename = {
  truncate = 45,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  absolute = false,
  format = false,
  icon = true,
  only_icon = false,
  unnamed = "unnamed",
  modified = "  ",
  readonly = "  ",
  modifiable = "  ",
}

-- dirname module sub-config
M.dirname = {
  format = ":t",
  truncate = 20,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  icon = "  ",
}

-- treesitter module sub-config
M.treesitter = {
  truncate = 130,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  disabled_icon = " 﫣 ",
  enabled_icon = " TS   ",
}

-- line and character location info module sub-config
M.position = {
  truncate = 32,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  buf_local_clients = true,
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
  top = " TOP",
  bottom = " BOT",
  extra = "  ",
}

--- NOTE: LSP configuration section

-- LSP server module sub-config
M.lsp = {
  server_label = " ",
  truncate = 80,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  buf_local_clients = true,
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

-- LSP server code-actions module sub-config
M.lightbulb = {
  truncate = 85,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  buf_local_clients = true,
  unavailable = " ",
  active = " ",
  loading = " ",
}

-- git diff module sub-config
M.git = {
  truncate = 70,
  buf_local_clients = true,
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
  short = false,
  branch = " ",
  main = " ",
  added = "  ",
  removed = "  ",
  changed = "  ",
}

-- LSP diagnostics module sub-config
M.diagnostics = {
  truncate = 63,
  buf_local_clients = true,
  severities = {
    ERROR = "",
    WARN = "",
    INFO = "",
    HINT = "",
  },
  style = {
    left = "█",
    right = "█",
    left_alt = "█",
    right_alt = "█",
  },
}

return M

-- vim:ft=lua
