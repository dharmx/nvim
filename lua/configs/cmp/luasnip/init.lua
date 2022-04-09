local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

luasnip.config.set_config {
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
}

local add_snippet = luasnip.snippet
local snippet_tables = require "configs.cmp.luasnip.snippets"

local function snippet_wrap(snippet)
  return add_snippet(snippet[1], snippet[2])
end

local snippets_primed = {}
for lang, snippets in pairs(snippet_tables) do
  snippets_primed[lang] = vim.tbl_map(snippet_wrap, snippets)
end

luasnip.add_snippets(nil, snippets_primed)

require("luasnip.loaders.from_vscode").lazy_load {
  paths = stdpath "config",
  include = { "lua", "python", "java", "sh", "markdown" },
}

-- vim:ft=lua
