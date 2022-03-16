local M = {
  { name = "nvim_lua", keyword_length = 2 },
  { name = "luasnip" },
  { name = "zsh" },
  { name = "fish" },
  { name = "omni", keyword_length = 5, max_item_count = 3 },
  { name = "tags" },
  { name = "nvim_lsp", keyword_length = 4, group_index = 1 },
  { name = "nvim_lsp_signature_help" },
  { name = "treesitter", keyword_length = 3 },
  { name = "path" },
  {
    name = "rg",
    keyword_length = 5,
    max_item_count = 4,
    option = { debounce = 500 },
  },
  {
    name = "dictionary",
    keyword_length = 4,
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
  },
  {
    name = "buffer",
    keyword_length = 4,
    max_item_count = 5,
    group_index = 2,
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
    dict = stdpath "config" .. "/lua/spell/en.dict",
  },
  { name = "npm", keyword_length = 4 },
  { name = "orgmode" },
  { name = "emoji", max_item_count = 10 },
  { name = "latex_symbols" },
  {
    name = "tmux",
    option = {
      all_panes = true,
      label = "[tmux]",
      trigger_characters = { "." },
      trigger_characters_ft = { "." },
    },
  },
}

local N = {
  { name = "cmdline", keyword_length = 2, priority = 3 },
  { name = "buffer", keyword_length = 5, priority = 2 },
  { name = "cmdline_history", keyword_length = 4, max_item_count = 2, priority = 1 },
  { name = "nvim_lsp_document_symbol", keyword_length = 4, priority = 3 },
}

return {
  normal = M,
  cmdline = N,
}
