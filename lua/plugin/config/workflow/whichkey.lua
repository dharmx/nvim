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
    ["<leader>"] = "SPC",
    ["<Leader>"] = "SPC",
    ["<cr>"] = "RET",
    ["<Cr>"] = "RET",
    ["<CR>"] = "RET",
    ["<tab>"] = "TAB",
    ["<Tab>"] = "TAB",
    ["<TAB>"] = "TAB",
    ["<bs>"] = "BSPC",
    ["<esc>"] = "ESC",
    ["<BS>"] = "BSPC",
    ["<Esc>"] = "ESC",
  },
  icons = {
    -- ▐
    breadcrumb = " ",
    separator = " ▎",
    group = " ",
  },
  popup_mappings = { popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" } },
  window = {
    border = "solid", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 3, 3, 3, 3 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 4,
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

local scan = require("plenary.scandir")
local _ = vim.tbl_map(function(mapping_path)
  local module = vim.list_slice(vim.split(vim.fn.fnamemodify(mapping_path, ":r"), "/"), 7)
  if module[2] ~= "lsp" then
    local loaded = require(table.concat(module, "."))
    which_key.register(loaded.mappings, loaded.options)
  end
end, scan.scan_dir(vim.fn.stdpath("config") .. "/lua/mapping"))

which_key.setup(config)

-- vim:ft=lua
