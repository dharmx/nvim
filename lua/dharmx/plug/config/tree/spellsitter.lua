local ok, spellsitter = pcall(require, "spellsitter")
if not ok then return end

spellsitter.setup({ enable = true })

-- vim:filetype=lua
