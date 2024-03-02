local ok, luasnip = pcall(require, "luasnip")
if not ok then return end
local types = require("luasnip.util.types")

luasnip.config.set_config({
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
  update_events = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "@float" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "●", "@storageclass" } },
      },
    },
  },
})

require("luasnip.loaders.from_vscode").lazy_load({
  paths = {
    require("lazy.core.config").options.root .. "/friendly-snippets",
  },
})
