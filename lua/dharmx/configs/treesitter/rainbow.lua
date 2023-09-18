local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  rainbow = {
    enable = true,
    query = "rainbow-parens",
    strategy = require("ts-rainbow").strategy.global,
  }
})
