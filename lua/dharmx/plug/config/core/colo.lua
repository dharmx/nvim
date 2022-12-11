local present, colo = pcall(require, "colo")
if not present then return end

colo.setup({
  theme = "radium_dark",
  manual = true,
  cycle = true,
  aggregates = {
    enable = true,
    items = {
      bold = true,
      underline = true,
    },
  },
  extensions = {
    feline = {
      enable = true,
    },
    bufferline = {
      enable = true,
    },
    devicons = {
      enable = true,
    },
  },
  mappings = {
    enable = true,
  },
})

-- vim:filetype=lua
