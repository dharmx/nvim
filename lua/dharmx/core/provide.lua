for _, provider in ipairs({
  "node",
  "perl",
  "python3",
  "ruby",
}) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = ""
  vim.cmd("silent! rsh")
end)

-- vim:filetype=lua
