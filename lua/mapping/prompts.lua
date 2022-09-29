local M = {}

M.mappings = {
  ["t<CR>"] = {
    "<CMD>Telescope<CR>",
    " Extensions",
  },
  ["t"] = {
    ["name"] = " Telescope",
    ["r"] = {
      "<CMD>Telescope registers<CR>",
      " Registers",
    },
    ["t"] = {
      "<CMD>Telescope filetypes<CR>",
      " Filetypes",
    },
    ["c"] = {
      "<CMD>Telescope neoclip<CR>",
      " Neoclip",
    },
    ["e"] = {
      "<CMD>Telescope env<CR>",
      " Variable",
    },
    ["b"] = {
      "<CMD>Telescope buffers<CR>",
      " Buffers",
    },
    ["o"] = {
      "<CMD>Telescope project<CR>",
      " Projects",
    },
    ["z"] = {
      "<CMD>Telescope current_buffer_fuzzy_find<CR>",
      " FZF",
    },
    ["n"] = {
      "<CMD>Telescope notify<CR>",
      " Notifications",
    },
    ["m"] = {
      "<CMD>Telescope packer<CR>",
      " Packer plugins",
    },
    ["k"] = {
      "<CMD>Telescope pickers<CR>",
      " Pickers",
    },
    ["l"] = {
      "<CMD>Telescope resume<CR>",
      " Load previous state",
    },

    ["f"] = {
      ["name"] = " File operations",
      ["f"] = {
        "<CMD>Telescope find_files<CR>",
        " Find files",
      },
      ["F"] = {
        "<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
        " Find files drop",
      },
      ["o"] = {
        "<CMD>Telescope oldfiles<CR>",
        " Old files",
      },
      ["w"] = {
        "<CMD>Telescope live_grep<CR>",
        " Word search [L]",
      },
      ["W"] = {
        "<CMD>Telescope grep_string<CR>",
        " Word search",
      },
      ["i"] = {
        "<CMD>Telescope media_files<CR>",
        " Media files",
      },
      ["z"] = {
        "<CMD>Telescope file_browser<CR>",
        " File browser",
      },
      ["c"] = {
        "<CMD>Telescope zoxide list<CR>",
        " ZOxide",
      },
    },
    ["s"] = {
      ["name"] = "ﲃ Glyphs and symbols",
      ["s"] = {
        "<CMD>Telescope symbols<CR>",
        " Symbols",
      },
      ["g"] = {
        "<CMD>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>",
        " Gitmoji",
      },
      ["m"] = {
        "<CMD>lua require'telescope.builtin'.symbols{ sources = {'math'} }<CR>",
        " Math",
      },
      ["l"] = {
        "<CMD>lua require'telescope.builtin'.symbols{ sources = {'latex'} }<CR>",
        " LaTeX",
      },
      ["k"] = {
        "<CMD>lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<CR>",
        " Kaomoji",
      },
      ["e"] = {
        "<CMD>Telescope emoji<CR>",
        "  Emojis",
      },
    },
    ["p"] = {
      ["name"] = " Records",
      ["w"] = {
        "<CMD>Telescope arecibo websearch<CR>",
        " Web search",
      },
      ["b"] = {
        "<CMD>Telescope bookmarks<CR>",
        " Bookmarks",
      },
      ["s"] = {
        "<CMD>Telescope search_history<CR>",
        " Search history",
      },
      ["c"] = {
        "<CMD>Telescope command_history<CR>",
        " Command history",
      },
    },
    ["g"] = {
      ["name"] = " Git files",
      ["f"] = {
        "<CMD>Telescope git_files<CR>",
        " Files",
      },
      ["t"] = {
        "<CMD>Telescope git_stash<CR>",
        " Stash",
      },
      ["s"] = {
        "<CMD>Telescope git_status<CR>",
        " Status",
      },
      ["c"] = {
        "<CMD>Telescope git_commits<CR>",
        " Commits",
      },
      ["b"] = {
        "<CMD>Telescope git_branches<CR>",
        " Branches",
      },
      ["m"] = {
        "<CMD>Telescope git_bcommits<CR>",
        " BCommits",
      },
      ["r"] = {
        "<CMD>Telescope repo<CR>",
        " Repositories",
      },
      ["i"] = {
        "<CMD>Telescope gh issues<CR>",
        "Issues",
      },
      ["p"] = {
        "<CMD>Telescope gh pull_request<CR>",
        "Pull Request",
      },
      ["g"] = {
        "<CMD>Telescope gh gist<CR>",
        "Gist",
      },
      ["e"] = {
        "<CMD>Telescope gh run<CR>",
        "Run",
      },
    },
    ["h"] = {
      ["name"] = " Help",
      ["h"] = {
        "<CMD>Telescope help_tags<CR>",
        " Help tags",
      },
      ["m"] = {
        "<CMD>Telescope man_pages<CR>",
        " Man Pages",
      },
      ["c"] = {
        "<CMD>Telescope cheatsheet<CR>",
        " Cheatsheet",
      },
      ["o"] = {
        "<CMD>Telescope vim_options<CR>",
        "הּ Vim options",
      },
      ["p"] = {
        "<CMD>Telescope commands<CR>",
        " Vim commands",
      },
      ["k"] = {
        "<CMD>Telescope keymaps<CR>",
        " Vim Mappings",
      },
      ["a"] = {
        "<CMD>Telescope autocommands<CR>",
        " Vim autocmds",
      },
    },
    ["w"] = {
      ["name"] = " Code",
      ["s"] = {
        "<CMD>Telescope spell_suggest<CR>",
        " Spelling",
      },
      ["t"] = {
        "<CMD>Telescope colorscheme<CR>",
        " Change theme",
      },
      ["l"] = {
        ["name"] = " LSP",
        ["w"] = {
          "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>",
          " Dynamic workspace symbols",
        },
        ["A"] = {
          "<CMD>Telescope lsp_range_code_actions<CR>",
          " Range code actions",
        },
        ["s"] = {
          "<CMD>Telescope lsp_workspace_symbols<CR>",
          " Workspace symbols",
        },
        ["S"] = {
          "<CMD>Telescope lsp_document_symbols<CR>",
          " Document symbols",
        },
        ["D"] = {
          "<CMD>Telescope lsp_type_definitions<CR>",
          " Type definitions",
        },
        ["i"] = {
          "<CMD>Telescope lsp_implementations<CR>",
          " Implementations",
        },
        ["a"] = {
          "<CMD>Telescope lsp_code_actions<CR>",
          " Code actions",
        },
        ["d"] = {
          "<CMD>Telescope lsp_definitions<CR>",
          " Definitions",
        },
        ["r"] = {
          "<CMD>Telescope lsp_references<CR>",
          " References",
        },
      },
    },
    ["a"] = {
      ["name"] = "ﰍ Web browse",
      ["b"] = {
        "<CMD>lua require('browse').browse({ bookmarks = require('configs.telescope.browse') })<CR>",
        " Browse bookmarks",
      },
      ["o"] = {
        "<CMD>lua require('browse').open_bookmarks({ bookmarks = require('configs.telescope.browse') })<CR>",
        " Open bookmarks",
      },
      ["i"] = {
        "<CMD>lua require('browse').input_search()<CR>",
        " Input search",
      },
    },
  },
}

M.options = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
  nowait = false,
}

return M

-- vim:ft=lua
