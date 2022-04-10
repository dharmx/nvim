--- Command mode command abbreviations.
-- @module settings.abbrevs

local M = {}

-- converts :Wq, :WQ, :wQ, etc to :wq
M["AutoCorrectQuitSaveCase"] = {
  { expression = true, buffer = "W", command = "((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))" },
  { expression = true, buffer = "Q", command = "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))" },
  { expression = true, buffer = "WQ", command = "((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))" },
  { expression = true, buffer = "Wq", command = "((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))" },
}

-- converts :Q, :q to q!
M["ForceQuit"] = {
  { expression = true, buffer = "Q", command = "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))" },
  { expression = true, buffer = "q", command = "((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))" },
}

return M

-- vim:ft=lua
