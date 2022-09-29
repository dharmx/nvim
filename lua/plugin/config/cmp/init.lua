local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local kinds = require("tables.kinds")
local kind_icons = kinds.material
local kind_sources = kinds.source.icon_only
local sources = require("tables.sources")
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
}

local fmt_orders = {
  { "kind", "abbr", "menu" },
  { "menu", "abbr", "kind" },
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
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
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
    ["<C-l>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.complete_common_string()
      end
      fallback()
    end, { "i", "c" }),
  }),
  sources = cmp.config.sources(source_normal),
  preselect = cmp.PreselectMode.None,
  window = {
    documentation = {
      border = "solid",
    },
    completion = {
      border = "solid",
      completeopt = "menu,menuone,noinsert",
      keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
      keyword_length = 1,
    },
  },
  view = {
    entries = {
      name = "custom",
    },
  },
  formatting = {
    fields = fmt_orders[1],
    format = cmp_fmt.material,
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
      require("utils.plugins").cmp_under,
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
    format = cmp_fmt.icon_only,
  },
  entries = { name = "custom", selection_order = "near_cursor" },
  preselect = cmp.PreselectMode.None,
}

for _, cmdtype in ipairs({ ":", "/", "?", "@", "=" }) do
  cmp.setup.cmdline(cmdtype, cmdlines)
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

require("plugin.config.cmp.issues")

-- vim:ft=lua
