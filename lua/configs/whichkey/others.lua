local M = {}

M.mappings = {
  ["<C-n>"] = { "<CMD>NvimTreeToggle<CR>", "פּ Explorer" },
  ["<C-m>"] = { "<CMD>NvimTreeFocus<CR>", "פּ Explorer Focus" },
  ["<leader>u"] = {
    ["name"] = "⏼ Toggles",
    ["s"] = { "<CMD>StatusLineTGL<CR>", " Statusline" },
    ["r"] = { "<CMD>RelativeNumberColumnTGL<CR>", "ﴳ Relative number column" },
    ["n"] = { "<CMD>NumberColumnTGL<CR>", "ﴳ Number column" },
    ["t"] = { "<CMD>TabLineTGL<CR>", " Tabline" },
  },
  ["<C-s>"] = { "<CMD>w<CR>", " Save file" },
  ["<C-\\>"] = { "<CMD>terminal<CR>", " Terminal" },
  ["<leader>v"] = { "<CMD>vs<CR>", " Vertical Split" },
  ["<leader>h"] = { "<CMD>sp<CR>", " Horizontal Split" },
  ["<Esc>"] = { "<CMD>noh<CR>", " Remove Highlights" },
  ["<C-y>"] = { "<CMD>%y+<CR>", "﯂ Copy all" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = false,
}

return M
