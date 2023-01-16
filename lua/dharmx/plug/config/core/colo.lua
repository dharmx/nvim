local ok, colo = pcall(require, "colo")
if not ok then return end

colo.setup({
  theme = require("dharmx").theme,
  manual = false,
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
