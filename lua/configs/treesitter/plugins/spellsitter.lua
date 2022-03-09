local present, spellsitter = pcall(require, "spellsitter")

if not present then
  return
end

spellsitter.setup { enable = false }

-- vim:ft=lua
