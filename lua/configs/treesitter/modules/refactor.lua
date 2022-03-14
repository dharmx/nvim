local maps = require("mappings").ts_refactor

local M = {
  highlight_current_scope = { enable = true },
  highlight_definitions = { enable = true },
  smart_rename = { enable = true, keymaps = maps.smart_rename },
  navigation = {
    enable = true,
    keymaps = maps.navigation,
  },
}

return M

-- vim:ft=lua
