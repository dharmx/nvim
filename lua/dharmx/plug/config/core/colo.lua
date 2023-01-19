local ok, colo = pcall(require, "colo")
if not ok then return end
local MainConfig = require("dharmx")

colo.setup({
  theme = MainConfig.theme,
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
      enable = false,
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
