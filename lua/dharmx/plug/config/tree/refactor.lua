local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  refactor = {
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
  },
})

-- vim:filetype=lua
