local ok, nodeaction = pcall(require,"ts-node-action")
if not ok then return end

nodeaction.setup()

-- vim:filetype=lua
