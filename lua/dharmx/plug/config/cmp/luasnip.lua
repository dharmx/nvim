local present, luasnip = pcall(require, "luasnip")
if not present then return end

luasnip.config.set_config({
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
  update_events = "TextChanged,TextChangedI",
})

vim.loop.fs_scandir(
  vim.fn.stdpath("config") .. "/lua/dharmx/plug/config/cmp/snip",
  vim.schedule_wrap(function(errors, userdata)
    if errors then return end
    while true do
      local name, category = vim.loop.fs_scandir_next(userdata)
      if not name then break end
      local snip_type = vim.fn.fnamemodify(name, ":r")
      luasnip.add_snippets(snip_type, require("dharmx.plug.config.cmp.snip." .. snip_type))
    end
    require("luasnip.loaders.from_vscode").lazy_load()
  end)
)

-- vim:filetype=lua
