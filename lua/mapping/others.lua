local M = {}

M.mappings = {
  ["<C-n>"] = {
    "<CMD>NvimTreeToggle<CR>",
    "פּ Explorer",
  },
  ["<F5>"] = {
    "<CMD>RnvimrToggle<CR>",
    "פּ Ranger explorer",
  },
  ["<leader>u"] = {
    ["name"] = "⏼ Toggles",
    ["s"] = {
      "<CMD>StatusLineTGL<CR>",
      " Statusline",
    },
    ["r"] = {
      "<CMD>RelativeNumberColumnTGL<CR>",
      "ﴳ Relative number column",
    },
    ["n"] = {
      "<CMD>NumberColumnTGL<CR>",
      "ﴳ Number column",
    },
    ["t"] = {
      "<CMD>TabLineTGL<CR>",
      " Tabline",
    },
  },
  ["<C-s>"] = {
    "<CMD>w<CR>",
    " Save file",
  },
  ["<leader>v"] = {
    "<CMD>vs | terminal<CR>",
    " Vertical split",
  },
  ["<leader>h"] = {
    "<CMD>sp | terminal<CR>",
    " Horizontal split",
  },
  ["<leader>V"] = {
    "<CMD>vs | new<CR>",
    " Vertical split",
  },
  ["<leader>H"] = {
    "<CMD>sp | new<CR>",
    " Horizontal split",
  },
  ["<Esc>"] = {
    "<CMD>noh<CR>",
    " Remove highlights",
  },
  ["<C-y>"] = {
    "<CMD>%y+<CR>",
    "﯂ Copy all",
  },
  ["<F2>"] = {
    "<CMD>SpellingTGL<CR>",
    " Spelling",
  },
  ["<leader>s"] = {
    ["name"] = " Spotify",
    ["n"] = {
      "<Plug>(SpotifySkip)",
      "ﭠ Skip",
    },
    ["p"] = {
      "<Plug>(SpotifyPause)",
      " Pause",
    },
    ["s"] = {
      "<Plug>(SpotifySave)",
      " Save",
    },
    ["o"] = {
      "<CMD>Spotify<CR>",
      " Start",
    },
    ["d"] = {
      "<CMD>SpotifyDevices<CR>",
      " Devices",
    },
    ["b"] = {
      "<Plug>(SpotifyPrev)",
      "ﭢ Previous",
    },
  },
  ["<leader>r"] = {
    ["name"] = " Reach",
    ["m"] = {
      "<CMD>lua require('reach').marks(require('tables.reach').marks)<CR>",
      " Marks",
    },
    ["t"] = {
      "<CMD>lua require('reach').tabpages(require('tables.reach').tabpages)<CR>",
      "ﯻ Tabpages",
    },
  },
  ["<leader><Tab>"] = {
    "<CMD>lua require('reach').buffers(require('tables.reach').buffers)<CR>",
    "ﴵ Buffers",
  },
  ["<F9>"] = {
    "<CMD>BookmarkToggle<CR>",
    "Add/Remove bookmark",
  },
  ["<leader>o"] = {
    ["g"] = {
      "<CMD>PP<CR>",
      "Save URI image to imgur.com",
    },
    ["l"] = {
      "<CMD>lua neovim.shorten()<CR>",
      "Shorten URL",
    },
    ["c"] = {
      "<CMD>PP<CR>",
      "Save buffer to dpaste.com",
    },
  },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  nowait = true,
}

return M

-- vim:ft=lua
