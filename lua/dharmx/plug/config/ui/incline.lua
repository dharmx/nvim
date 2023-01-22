local ok, incline = pcall(require, "incline")
if not ok then return end

incline.setup(require("colo.extensions.incline").config)

-- vim:filetype=lua
