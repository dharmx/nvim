local A = vim.api
local colo = require("colo.api").theme

local ns1 = A.nvim_create_namespace("ns1")
A.nvim_win_set_hl_ns(A.nvim_get_current_win(), ns1)
colo.set("mountain_dark", ns1)

-- local ns1000 = A.nvim_create_namespace("ColoSplits1000")
-- A.nvim_win_set_hl_ns(1000, ns1000)
-- colo.set("noel_dark", ns1000)

-- local ns1003 = A.nvim_create_namespace("ColoSplits1003")
-- A.nvim_win_set_hl_ns(1003, ns1003)
-- colo.set("one_dark", ns1003)

-- A.nvim_win_set_hl_ns(1006, -1)
-- A.nvim_win_set_hl_ns(1000, -1)
A.nvim_win_set_hl_ns(A.nvim_get_current_win(), -1)
