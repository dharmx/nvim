local present, spellsitter = pcall(require, "spellsitter")

if not present then
  return
end

spellsitter.setup({ enable = true })

-- vim:ft=lua
