local exclude = {
  "sh",
  "cpp",
  "java",
  "python",
  "dart",
}

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    _ = vim.tbl_contains(exclude, vim.bo.filetype)
    or vim.notify("Hit!") -- or use vim.cmd "NeoFormat"
  end,
})

-- vim:filetype=lua
