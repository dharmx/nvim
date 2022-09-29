local present, orgmode = pcall(require, "orgmode")

if not present then
  return
end

orgmode.setup()

-- vim:ft=lua
