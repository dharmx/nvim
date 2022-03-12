local M = {}

table.insert(M, { expression = true, buffer = "W", command = "((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))" })
table.insert(M, { expression = true, buffer = "Q", command = "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))" })
table.insert(M, { expression = true, buffer = "WQ", command = "((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))" })
table.insert(M, { expression = true, buffer = "Wq", command = "((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))" })
table.insert(M, { expression = true, buffer = "Q", command = "((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q!'):('q'))" })
table.insert(M, { expression = true, buffer = "q", command = "((getcmdtype() is# ':' && getcmdline() is# 'q')?('q!'):('q'))" })

return M

-- vim:ft=lua
