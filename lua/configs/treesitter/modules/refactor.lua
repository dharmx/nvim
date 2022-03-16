local M = {
  highlight_current_scope = { enable = true },
  highlight_definitions = { enable = true },
  smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
  navigation = {
    enable = true,
    keymaps = {
      goto_definition = "gnd",
      list_definitions = "gnD",
      list_definitions_toc = "gO",
      goto_next_usage = "<a-*>",
      goto_previous_usage = "<a-#>",
    },
  },
}

return M

-- vim:ft=lua
