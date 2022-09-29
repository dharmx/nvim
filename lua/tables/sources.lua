--- NOTE: nvim-cmp source configururation table.
-- @see :help max_item_count, :help keyword_length and others to see what they do.

-- sources used in buffer window
local M = {
  {
    name = "zsh",
    max_item_count = 5,
  },
  {
    name = "fish",
    max_item_count = 5,
  },
  {
    name = "tags",
    max_item_count = 6,
  },
  {
    name = "gh_issues",
    max_item_count = 10,
  },
  {
    name = "conventionalcommits",
  },
  {
    name = "pandoc_references",
  },
  {
    name = "nvim_lua",
    keyword_length = 2,
  },
  {
    name = "luasnip",
    max_item_count = 3,
  },
  {
    name = "nvim_lsp",
    keyword_length = 2,
    group_index = 1,
  },
  {
    name = "buffer",
    keyword_length = 4,
    max_item_count = 5,
    group_index = 2,
  },
  {
    name = "nvim_lsp_signature_help",
  },
  {
    name = "nvim_lsp_document_symbol",
    keyword_length = 4,
    priority = 3,
  },
  {
    name = "treesitter",
    keyword_length = 3,
    max_item_count = 4,
  },
  {
    name = "path",
    max_item_count = 10,
  },
  {
    name = "rg",
    keyword_length = 5,
    max_item_count = 4,
    option = {
      debounce = 300,
    },
  },
  {
    name = "dictionary",
    keyword_length = 4,
    priority = 2,
    option = {
      convert_case = true,
    },
    max_item_count = 5,
  },
  {
    name = "spell",
    keyword_length = 5,
    option = {
      convert_case = true,
    },
    max_item_count = 5,
    priority = 1,
  },
  {
    name = "omni",
    keyword_length = 5,
    max_item_count = 3,
  },
  {
    name = "digraphs",
    priority = 3,
    max_item_count = 5,
    keyword_length = 5,
  },
  { name = "cmp_git" },
  {
    name = "calc",
    keyword_length = 2,
    max_item_count = 3,
  },
  {
    name = "look",
    keyword_length = 2,
    max_item_count = 4,
    option = {
      convert_case = true,
      loud = true,
    },
    dict = vim.fn.stdpath("config") .. "/lua/spell/en.dict",
  },
  { name = "latex_symbols" },
  {
    name = "npm",
    keyword_length = 4,
  },
  { name = "orgmode" },
  {
    name = "emoji",
    max_item_count = 10,
  },
  { name = "greek" },
  {
    name = "tmux",
    option = {
      all_panes = true,
      label = "TMX",
      trigger_characters = {
        ".",
      },
      trigger_characters_ft = {
        ".",
      },
    },
  },
}

-- sources used in cmdline
local N = {
  {
    name = "cmdline",
    keyword_length = 2,
    priority = 3,
  },
  {
    name = "buffer",
    keyword_length = 3,
    priority = 2,
  },
  {
    name = "cmdline_history",
    keyword_length = 5,
    max_item_count = 3,
    priority = 1,
  },
  {
    name = "nvim_lsp_document_symbol",
    keyword_length = 4,
    priority = 3,
  },
}

return {
  normal = M,
  cmdline = N,
}

-- vim:ft=lua
