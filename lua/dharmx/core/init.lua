local config = vim.fn.stdpath("config") .. "/lua/dharmx"

for _, provider in ipairs({
  "node",
  "perl",
  "python3",
  "ruby",
}) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

local scanned = vim.fn.readdir(config .. "/core")
for _, file in ipairs(scanned) do
  if file ~= "init.lua" then require("dharmx.core." .. vim.fn.fnamemodify(file, ":r")) end
end

vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = ""
  vim.cmd("silent! rsh")
end)

-- vim:filetype=lua
