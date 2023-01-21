local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  tree_docs = {
    enable = true,
  },
})

-- vim:filetype=lua
