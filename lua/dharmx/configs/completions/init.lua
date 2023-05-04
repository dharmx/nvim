local ok, cmp = pcall(require, "cmp")
if not ok then return end

-- IMPORTS/UTILS {{{
local kind = require("dharmx.utils.kind").sleek
local luasnip = require("luasnip")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function custom_compare(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find("^_+")
  local _, entry2_under = entry2.completion_item.label:find("^_+")
  entry1_under = entry1_under or 0
  entry2_under = entry2_under or 0
  if entry1_under > entry2_under then
    return false
  elseif entry1_under < entry2_under then
    return true
  end
end
-- }}}

local config = {
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-D>"] = cmp.mapping.scroll_docs(-4),
    ["<C-F>"] = cmp.mapping.scroll_docs(4),
    ["<C-I>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "c" }),
    ["<C-O>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "c" }),
    ["<C-E>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.abort(),
    ["<S-Tab>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ["<C-L>"] = cmp.mapping(function(fallback)
      if cmp.visible() then return cmp.complete_common_string() end
      fallback()
    end, { "i", "c" }),
    ["<C-Y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      { "i", "c" }
    ),
    ["<M-Y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      { "i", "c" }
    ),
    ["<C-Space>"] = cmp.mapping({
      i = cmp.mapping.complete(),
      c = function()
        if cmp.visible() then
          if not cmp.confirm({ select = true }) then return end
        else
          cmp.complete()
        end
      end,
    }),
  }),
  preselect = cmp.PreselectMode.Item,
  sources = cmp.config.sources({ -- SOURCES {{{
    {
      name = "zsh",
      max_item_count = 5,
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
      keyword_length = 5,
      max_item_count = 5,
      group_index = 2,
    },
    {
      name = "nvim_lsp_signature_help",
    },
    {
      name = "path",
      max_item_count = 10,
      priority = 2,
    },
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
  }), -- }}}
  window = { -- UI {{{
    documentation = {
      border = "solid",
    },
    completion = {
      border = "none",
      completeopt = "menu,menuone,noinsert",
      col_offset = 0,
      side_padding = 1,
      keyword_length = 1,
    },
  },
  view = {
    entries = {
      name = "custom",
    },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, item)
      -- item.menu = entry.source.name
      item.kind = kind[item.kind] .. " " .. item.kind
      return item
    end,
  },
  experimental = {
    ghost_text = true,
  },
  completion = {
    completeopt = "menu,menuone,noselect,preview",
    autocomplete = false,
  }, -- }}}
  sorting = { -- SORTERS {{{
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      custom_compare,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }, -- }}}
}

cmp.setup(config)

-- CMDLINES -- {{{
local cmdline = {
  sources = cmp.config.sources({
    {
      name = "cmdline",
      keyword_length = 2,
      priority = 3,
    },
  }),
  mapping = config.mapping,
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, item)
      item.kind = kind[item.kind] .. " " .. item.kind
      return item
    end,
  },
  entries = { name = "custom", selection_order = "near_cursor" },
  preselect = cmp.PreselectMode.Item,
}

for _, cmdtype in ipairs({ ":", "@", "=" }) do
  cmp.setup.cmdline(cmdtype, cmdline)
end

cmp.setup.cmdline("/", {
  {
    name = "buffer",
    keyword_length = 5,
    priority = 4,
  },
  {
    name = "nvim_lsp_document_symbol",
    keyword_length = 4,
    priority = 3,
  },
  mapping = config.mapping,
})

cmp.setup.cmdline("?", {
  {
    name = "buffer",
    keyword_length = 5,
    priority = 4,
  },
  {
    name = "nvim_lsp_document_symbol",
    keyword_length = 4,
    priority = 3,
  },
  mapping = config.mapping,
})
-- }}}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
