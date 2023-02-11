local ok, cmp = pcall(require, "cmp")
if not ok then return end

local kind = require("dharmx.util.kind").sleek
local luasnip = require("luasnip")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function comparator(entry1, entry2)
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

local config = {
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-B>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-F>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Y>"] = cmp.config.disable,
    ---@diagnostic disable-next-line: missing-parameter
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-E>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump_prev()
      else
        fallback()
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end),
    ["<C-L>"] = cmp.mapping(function(fallback)
      if cmp.visible() then return cmp.complete_common_string() end
      fallback()
    end, { "i", "c" }),
  }),
  sources = cmp.config.sources({
    {
      name = "plugins",
      max_item_count = 3,
    },
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
      keyword_length = 5,
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
  }),
  preselect = cmp.PreselectMode.Item,
  window = {
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
    format = function(_, item)
      item.kind = kind[item.kind] .. " " .. item.kind
      return item
    end,
  },
  experimental = {
    ghost_text = true,
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  sorting = {
    comparators = {
      -- cmp.config.compare.offset,
      -- cmp.config.compare.exact,
      comparator,
      -- cmp.config.compare.score,
      -- cmp.config.compare.kind,
      -- cmp.config.compare.sort_text,
      -- cmp.config.compare.length,
      -- cmp.config.compare.order,
    },
  },
}

cmp.setup(config)

local cmdlines = {
  sources = cmp.config.sources({
    {
      name = "cmdline",
      keyword_length = 2,
      priority = 3,
    },
    {
      name = "buffer",
      keyword_length = 5,
      priority = 4,
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
  }),
  mapping = cmp.mapping.preset.cmdline(),
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

for _, cmdtype in ipairs({ ":", "/", "?", "@", "=" }) do
  cmp.setup.cmdline(cmdtype, cmdlines)
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- vim:filetype=lua
