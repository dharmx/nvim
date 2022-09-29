local M = {}

M.mappings = {
  ["name"] = " Buffers",
  ["<leader>b"] = {
    ["name"] = "﬘ Bufferline",
    ["i"] = {
      "<CMD>BufferLinePick<CR>",
      " Pick buffer",
    },
    ["n"] = {
      "<CMD>BufferLineMoveNext<CR>",
      " Move next",
    },
    ["p"] = {
      "<CMD>BufferLineMovePrev<CR>",
      " Move previous",
    },
    ["l"] = {
      "<CMD>BufferLineCloseLeft<CR>",
      " Close left",
    },
    ["r"] = {
      "<CMD>BufferLineCloseRight<CR>",
      " Close right",
    },
    ["x"] = {
      "<CMD>BufferLinePickClose<CR>",
      " Pick close",
    },
    ["s"] = {
      ["name"] = " Sort",
      ["d"] = {
        "<CMD>BufferLineSortByDirectory<CR>",
        " Directory",
      },
      ["t"] = {
        "<CMD>BufferLineSortByTabs<CR>",
        "ﴵ Tabs",
      },
      ["e"] = {
        "<CMD>BufferLineSortByExtension<CR>",
        "  Extension",
      },
      ["r"] = {
        "<CMD>BufferLineSortByRelativeDirectory<CR>",
        " Relative directory",
      },
    },
    ["="] = {
      ["name"] = "ﮄ Goto Buffer",
      ["1"] = {
        "<CMD>BufferLineGoToBuffer 1<CR>",
        " 0",
      },
      ["2"] = {
        "<CMD>BufferLineGoToBuffer 2<CR>",
        " 1",
      },
      ["3"] = {
        "<CMD>BufferLineGoToBuffer 3<CR>",
        " 2",
      },
      ["4"] = {
        "<CMD>BufferLineGoToBuffer 4<CR>",
        " 3",
      },
      ["5"] = {
        "<CMD>BufferLineGoToBuffer 5<CR>",
        " 4",
      },
      ["6"] = {
        "<CMD>BufferLineGoToBuffer 6<CR>",
        " 5",
      },
      ["7"] = {
        "<CMD>BufferLineGoToBuffer 7<CR>",
        " 6",
      },
      ["8"] = {
        "<CMD>BufferLineGoToBuffer 8<CR>",
        " 7",
      },
      ["9"] = {
        "<CMD>BufferLineGoToBuffer 9<CR>",
        " 8",
      },
      ["0"] = {
        "<CMD>BufferLineGoToBuffer 10<CR>",
        " 9",
      },
    },
  },
  ["<M-]>"] = {
    "<CMD>BufferLineCycleNext<CR>",
    " Next",
  },
  ["<M-[>"] = {
    "<CMD>BufferLineCyclePrev<CR>",
    " Previous",
  },
  ["<C-t>"] = {
    "<CMD>tabnew<CR>",
    " New tab",
  },
  ["<C-b>"] = {
    "<CMD>enew<CR>",
    " New buffer",
  },
  ["<leader>q"] = {
    "<CMD>lua require('utils').delete_buffer()<CR>",
    " Delete",
  },
  ["<leader>B"] = {
    ["name"] = "ﴵ Tabs",
    ["h"] = {
      "<CMD>tablast<CR>",
      " Last",
    },
    ["l"] = {
      "<CMD>tabfirst<CR>",
      " First",
    },
    ["k"] = {
      "<CMD>tabonly<CR>",
      " Only",
    },
    ["j"] = {
      "<CMD>tabrewind<CR>",
      " Rewind",
    },
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
