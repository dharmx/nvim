local ok, neodev = pcall(require, "neodev")
if not ok then return end

neodev.setup({
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = { "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true,
  lspconfig = true,
  pathStrict = true,
})

-- vim:filetype=lua
