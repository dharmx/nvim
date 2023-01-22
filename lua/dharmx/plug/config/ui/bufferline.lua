local ok, bufferline = pcall(require, "bufferline")
if not ok then return end

bufferline.setup(require("colo.extensions.bufferline").config)

-- vim:filetype=lua
