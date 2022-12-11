local present, cmp = pcall(require, "cmp")

if not present then return end

local kinds = require("dharmx.list.kind")
local kind_icons = kinds.type_icons
local kind_sources = kinds.source.icon_only
local sources = require("dharmx.list.source")
local source_normal = sources.normal
local source_cmdline = sources.cmdline
local snip = require("luasnip")

local api = vim.api

local cmp_fmt = {
  icon_only = function(entry, vim_item)
    vim_item.menu = kind_sources[entry.source.name]
    vim_item.kind = kind_icons[vim_item.kind] .. " "
    return vim_item
  end,
  full_info = function(entry, vim_item)
    vim_item.menu = kind_sources[entry.source.name]
    vim_item.kind = kind_icons[vim_item.kind] .. " " .. vim_item.kind .. " "
    return vim_item
  end,
  material = function(_, vim_item)
    vim_item.menu = vim_item.kind
    vim_item.kind = kind_icons[vim_item.kind] .. " "
    return vim_item
  end,
  colorful = function(_, vim_item)
    vim_item.kind = kind_icons[vim_item.kind] .. " " .. vim_item.kind
    return vim_item
  end,
}

local fmt_orders = {
  { "kind", "abbr", "menu" },
  { "menu", "abbr", "kind" },
  { "abbr", "kind", "menu" },
  { "abbr", "kind" },
  { "abbr", "menu" },
  { "kind", "abbr" },
}

local function has_words_before()
  local line, col = unpack(api.nvim_win_get_cursor(0))
  return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
      elseif snip.jumpable(-1) then
        api.nvim_feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "i", "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snip.expand_or_jumpable() then
        api.nvim_feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "i", "")
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
  sources = cmp.config.sources(source_normal),
  preselect = cmp.PreselectMode.Item, -- None
  window = {
    documentation = {
      border = "solid",
    },
    completion = {
      border = "none",
      completeopt = "menu,menuone,noinsert",
      -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
    },
  },
  view = {
    entries = {
      name = "custom",
    },
  },
  formatting = {
    fields = fmt_orders[3],
    format = cmp_fmt.colorful,
  },
  experimental = {
    ghost_text = true,
  },
  completion = {
    completeopt = "menu,menuone,noselect",
    -- autocomplete = true,
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

cmp.setup(config)

local cmdlines = {
  sources = cmp.config.sources(source_cmdline),
  mapping = cmp.mapping.preset.cmdline(),
  formatting = {
    fields = fmt_orders[2],
    format = cmp_fmt.full_info,
  },
  entries = { name = "custom", selection_order = "near_cursor" },
  preselect = cmp.PreselectMode.Item, -- None
}

for _, cmdtype in ipairs({ ":", "/", "?", "@", "=" }) do
  cmp.setup.cmdline(cmdtype, cmdlines)
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- vim:filetype=lua
