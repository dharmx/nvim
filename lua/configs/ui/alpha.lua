local present, alpha = pcall(require, "alpha")

local btn_gen = require("utils.plugins").btn_gen

local heading = {
  type = "text",
  val = require("tables.banners")["areee??"],
  opts = {
    position = "center",
    hl = "AlphaHeading",
  },
}

local buttons = {
  type = "group",
  val = {
    btn_gen("  Find File", " LDR tff ", "WildMenu"),
    btn_gen("  Recents", " LDR tfo ", "Boolean"),
    btn_gen("  Find Word", " LDR tfw ", "String"),
  },
  opts = {
    position = "center",
    spacing = 1,
  },
}

local loaded = {
  type = "text",
  val = string.format(" Loaded %d plugins", vim.tbl_count(packer_plugins)),
  opts = {
    position = "center",
    hl = "AlphaLoaded",
  },
}

local footing = {
  type = "text",
  val = "-kv- ",
  opts = {
    position = "center",
    hl = "AlphaFooting",
  },
}

local layout = {
  { type = "padding", val = 9 },
  heading,
  { type = "padding", val = 2 },
  footing,
  { type = "padding", val = 1 },
  buttons,
  { type = "padding", val = 1 },
  loaded,
}

local config = {
  layout = layout,
  opts = { margin = 10 },
}

alpha.setup(config)

return config

-- vim:ft=lua
