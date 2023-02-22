local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 2500,
  },
})
