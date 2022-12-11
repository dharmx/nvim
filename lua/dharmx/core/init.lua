local config = vim.fn.stdpath("config") .. "/lua/dharmx"

for _, provider in ipairs({
  "node",
  "perl",
  "python3",
  "ruby",
}) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.loop.fs_scandir(
  config .. "/core",
  vim.schedule_wrap(function(errors, userdata)
    if errors then return end
    while true do
      local name, category = vim.loop.fs_scandir_next(userdata)
      if not name then break end
      if name ~= "init.lua" and category == "file" then require("dharmx.core." .. vim.fn.fnamemodify(name, ":r")) end
    end
  end)
)

vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = ""
  vim.cmd("silent! rsh")
end)

-- vim:filetype=lua
