local M = {}

M.mappings = {
  ["<leader>lf"] = { "<CMD>luafile %<CR>", "Load current Lua file" },
  ["<C-n>"] = { "<CMD>Neotree filesystem toggle left<CR>", "פּ Explorer" },
  ["<C-m>"] = { "<CMD>NvimTreeFocus<CR>", "פּ Explorer focus" },
  ["<F5>"] = { "<CMD>RnvimrToggle<CR>", "פּ Ranger explorer" },
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
  ["<leader>V"] = { "<CMD>vs | enew<CR>", " Horizontal split" },
  ["<leader>H"] = { "<CMD>sp | enew<CR>", " Horizontal split" },
  ["<Esc>"] = { "<CMD>noh<CR>", " Remove highlights" },
  ["<C-y>"] = { "<CMD>%y+<CR>", "﯂ Copy all" },
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
    ["m"] = { "<CMD>lua require('reach').marks(require('tables.reach').marks)<CR>", " Marks" },
    ["t"] = { "<CMD>lua require('reach').tabpages(require('tables.reach').tabpages)<CR>", "ﯻ Tabpages" },
  },
  ["<leader><Tab>"] = { "<CMD>lua require('reach').buffers(require('tables.reach').buffers)<CR>", "ﴵ Buffers" },
  ["<leader>Q"] = { "<CMD>qa!<CR>", " Quit neovim" },
  ["<leader><leader>q"] = { "<CMD>q<CR>", " Quit" },
  ["<F9>"] = { "<CMD>BookmarkToggle<CR>", "Add/Remove bookmark" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
