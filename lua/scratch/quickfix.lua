local F = vim.fn

-- do a :grep item then :copen
-- it will be nice if this errors
vim.cmd.grep("hello world")
vim.cmd.copen()

local items = F.getqflist()
vim.notify(vim.inspect(items))
for _, item in ipairs(items) do
  -- print out all error label texts
  vim.fn.system({ "notify-send", item.text })
end

-- we will be just changing a label of the first item
-- to our already existing quickfix list
local changed_item = items[1]
changed_item.text = "I have changed this!"

-- see :help setqflist
F.setqflist({ changed_item }, "a")
