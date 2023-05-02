local util = require("dharmx.util").nvim

for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = ""
  vim.cmd("silent! rsh")
end)

return {
  setup = function(items)
    items = vim.tbl_flatten({ "init.lua", items })
    local config = vim.fn.stdpath("config") .. "/lua/dharmx/core"
    local function on_entry(file) vim.cmd.source(config .. "/" .. file) end
    util.exclude(items, config, on_entry)
  end,
}
