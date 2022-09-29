local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

luasnip.config.set_config({
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
})

-- INFO: A hook i.e. any file inside cmp.snippets will be loaded
local scan = require("plenary.scandir")
for _, path in ipairs(scan.scan_dir(vim.fn.stdpath("config") .. "/lua/plugin/config/cmp/snippets")) do
  local module_path = vim.list_slice(vim.split(vim.fn.fnamemodify(path, ":r"), "/"), 7)
  luasnip.add_snippets(module_path[#module_path], require(table.concat(module_path, ".")))
end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = vim.fn.stdpath("config"),
  include = { "lua", "python", "java", "sh", "markdown" },
})

-- vim:ft=lua
