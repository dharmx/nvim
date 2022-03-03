local present, which_key = pcall(require, "which-key")

if not present then
  return
end

local config = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<Space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<Cr>"] = "RET",
    ["<CR>"] = "RET",
    ["<tab>"] = "TAB",
    ["<Tab>"] = "TAB",
    ["<TAB>"] = "TAB",
  },
  icons = {
    breadcrumb = " ",
    separator = " ",
    group = " ",
  },
  popup_mappings = require("mappings").which_key_nvim,
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CMD>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

which_key.setup(config)
