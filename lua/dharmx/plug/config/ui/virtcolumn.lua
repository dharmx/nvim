local ok, virtcol = pcall(require, "virt-column")
if not ok then return end
local MainConfig = require("dharmx")

virtcol.setup({ char = MainConfig.ui.small.virtualcolumn })

-- vim:filetype=lua
