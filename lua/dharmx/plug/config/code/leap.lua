local ok, leap = pcall(require, "leap")
if not ok then return end

leap.add_default_mappings()
