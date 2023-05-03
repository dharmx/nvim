local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  textsubjects = {
    enable = true,
    prev_selection = ",",
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },
})
