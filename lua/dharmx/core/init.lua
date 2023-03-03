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
    local on_entry = function(file) require("dharmx.core." .. vim.fn.fnamemodify(file, ":r")) end
    util.exclude(items, config, on_entry)
  end,
}
