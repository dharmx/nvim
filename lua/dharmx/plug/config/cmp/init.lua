local ok, cmp = pcall(require, "cmp")
if not ok then return end

local MainConfig = require("dharmx")
local kind = MainConfig.kind.type
local luasnip = require("luasnip")
local A = vim.api

local function has_words_before()
  local line, col = unpack(A.nvim_win_get_cursor(0))
  return col ~= 0 and A.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
        A.nvim_feedkeys(A.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "i", true)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        A.nvim_feedkeys(A.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "i", true)
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
  sources = cmp.config.sources(MainConfig.source.normal),
  preselect = cmp.PreselectMode.Item,
  window = {
    documentation = {
      border = MainConfig.ui.border,
    },
    completion = {
      border = MainConfig.ui.cmp_border,
      completeopt = "menu,menuone,noinsert",
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
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      comparator,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

cmp.setup(config)

local cmdlines = {
  sources = cmp.config.sources(MainConfig.source.cmdline),
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
