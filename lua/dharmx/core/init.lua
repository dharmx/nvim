for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

local function exclude(items)
  items = vim.F.if_nil(items, {})
  local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/dharmx/core")
  for _, file in ipairs(files) do
    if file ~= "init.lua" and not vim.tbl_contains(items, file) then
      require("dharmx.core." .. vim.fn.fnamemodify(file, ":r"))
    end
  end
end

vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = ""
  vim.cmd("silent! rsh")
end)

return { exclude = exclude }

-- vim:filetype=lua
