local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  matchup = {
    enable = true,
    disable = {
      "ruby",
    },
  },
})

-- vim:filetype=lua
