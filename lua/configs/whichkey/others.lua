local M = {}

M.mappings = {
  ["<C-n>"] = { "<CMD>NvimTreeToggle<CR>", "פּ Explorer" },
  ["<C-m>"] = { "<CMD>NvimTreeFocus<CR>", "פּ Explorer focus" },
  ["<leader>u"] = {
    ["name"] = "⏼ Toggles",
    ["s"] = { "<CMD>StatusLineTGL<CR>", " Statusline" },
    ["r"] = { "<CMD>RelativeNumberColumnTGL<CR>", "ﴳ Relative number column" },
    ["n"] = { "<CMD>NumberColumnTGL<CR>", "ﴳ Number column" },
    ["t"] = { "<CMD>TabLineTGL<CR>", " Tabline" },
  },
  ["<C-s>"] = { "<CMD>w<CR>", " Save file" },
  ["<C-\\>"] = { "<CMD>terminal<CR>", " Terminal" },
  ["<leader>v"] = { "<CMD>vs<CR>", " Vertical split" },
  ["<leader>h"] = { "<CMD>sp<CR>", " Horizontal split" },
  ["<Esc>"] = { "<CMD>noh<CR>", " Remove highlights" },
  ["<C-y>"] = { "<CMD>%y+<CR>", "﯂ Copy all" },
  ["<F3>"] = { "<CMD>ColorizerToggle<CR>", "﯂ Enable colorizer" },
  ["<F2>"] = { "<CMD>SpellingTGL<CR>", " Spelling" },
  ["<leader>s"] = {
    ["name"] = " Spotify",
    ["n"] = { "<Plug>(SpotifySkip)", "ﭠ Skip" },
    ["p"] = { "<Plug>(SpotifyPause)", " Pause" },
    ["s"] = { "<Plug>(SpotifySave)", " Save" },
    ["o"] = { "<CMD>Spotify<CR>", " Start" },
    ["d"] = { "<CMD>SpotifyDevices<CR>", " Devices" },
    ["b"] = { "<Plug>(SpotifyPrev)", "ﭢ Previous" },
  },
  ["<leader>r"] = {
    ["name"] = " Reach",
    ["b"] = { "<CMD>lua require('reach').buffers(require('configs.reach').buffers)<CR>", "ﴵ Buffers" },
    ["m"] = { "<CMD>lua require('reach').marks(require('configs.reach').marks)<CR>", " Marks" },
    ["t"] = { "<CMD>lua require('reach').tabpages(require('configs.reach').tabpages)<CR>", "ﯻ Tabpages" },
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
