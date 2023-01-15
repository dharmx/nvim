local ok, luasnip = pcall(require, "luasnip")
if not ok then return end

luasnip.config.set_config({
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
  update_events = "TextChanged,TextChangedI",
})

require("luasnip.loaders.from_vscode").lazy_load()

-- vim:filetype=lua
