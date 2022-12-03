local present, colo = pcall(require, "colo")

if not present then
  return
end

colo.setup({
  integrations = {
    feline = {
      enable = true,
    },
    bufferline = {
      enable = true,
    },
    devicons = {
      enable = true,
    },
    alpha = {
      enable = true,
    },
  },
})

-- vim:filetype=lua
