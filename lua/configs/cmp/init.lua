local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local fn = vim.fn
local kinds = require "tables.kinds"
local kind_icons = kinds.item
local kind_sources = kinds.source

local function cmp_item_format(entry, vim_item)
  vim_item.menu = kind_sources[entry.source.name]
  vim_item.kind = " " .. kind_icons[vim_item.kind] .. " " .. vim_item.kind .. " "
  return vim_item
end

local config = {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = require("mappings").nvim_cmp(cmp),
  sources = cmp.config.sources {
    { name = "nvim_lua", keyword_length = 2 },
    { name = "luasnip" },
    { name = "zsh" },
    { name = "fish" },
    { name = "omni" },
    { name = "tags" },
    { name = "nvim_lsp", keyword_length = 4 },
    { name = "nvim_lsp_signature_help" },
    { name = "treesitter", keyword_length = 6 },
    { name = "path" },
    { name = "rg", keyword_length = 5 },
    {
      name = "dictionary",
      keyword_length = 4,
      option = { convert_case = true },
    },
    { name = "spell", keyword_length = 5, option = { convert_case = true } },
    { name = "buffer", keyword_length = 4 },
    { name = "cmp_git" },
    { name = "calc" },
    {
      name = "look",
      keyword_length = 2,
      option = { convert_case = true, loud = true },
      dict = vim.fn.stdpath "config" .. "/lua/spell/en.dict",
    },
    { name = "npm", keyword_length = 4 },
    { name = "orgmode" },
    { name = "emoji" },
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
  },
  formatting = {
    format = cmp_item_format,
  },

  completion = { completeopt = "menu,menuone,noselect" },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

cmp.setup(config)

local cmdlines = {
  sources = cmp.config.sources {
    { name = "cmdline", keyword_length = 2 },
    { name = "buffer", keyword_length = 5 },
    { name = "cmdline_history", keyword_length = 4 },
    { name = "nvim_lsp_document_symbol", keyword_length = 4 },
  },
  formatting = {
    format = cmp_item_format,
  },
}

for _, cmdtype in ipairs { ":", "/", "?", "@", "=" } do
  cmp.setup.cmdline(cmdtype, cmdlines)
end

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "fennel"

-- vim:ft=lua
