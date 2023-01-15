local ok, format = pcall(require, "lsp-format")
if not ok then return end

format.setup({
  typescript = {
    tab_width = function() return vim.opt.shiftwidth:get() end,
  },
  yaml = { tab_width = 2 },
})

-- vim:filetype=lua
