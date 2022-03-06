local maps = require("mappings").ts_refactor

local M = {
  highlight_current_scope = { enable = false },
  highlight_definitions = { enable = false },
  smart_rename = { enable = false, keymaps = maps.smart_rename },
  navigation = {
    enable = false,
    keymaps = maps.navigation,
  },
}

return M
