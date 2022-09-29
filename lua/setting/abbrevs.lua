--- Command mode command abbreviations.

local abbrev = require("utils.neovim").abbrev

-- converts :Wq, :WQ, :wQ, etc to :wq
abbrev("W", "((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))", true)
abbrev("Q", "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))", true)
abbrev("WQ", "((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))", true)
abbrev("Wq", "((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))", true)
abbrev("wQ", "((getcmdtype() is# ':' && getcmdline() is# 'wQ')?('wq'):('wQ'))", true)

-- converts :Q, :q to q!
abbrev("Q", "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))", true)
abbrev("q", "((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))", true)

-- vim:ft=lua
