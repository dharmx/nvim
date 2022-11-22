local present, colo = pcall(require, "colo")

if not present then
  return
end

colo.setup()

-- vim:filetype=lua
