local ok, tree = pcall(require, "nvim-treesitter.configs")
if not ok then return end

tree.setup({
  querylinter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

-- vim:filetype=lua
