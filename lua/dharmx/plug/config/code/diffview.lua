local ok, diffview = pcall(require, "diffview")
if not ok then return end

diffview.setup()
