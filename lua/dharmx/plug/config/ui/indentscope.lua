local ok, mini = pcall(require, "mini.indentscope")
if not ok then return end
local MainConfig = require("dharmx")

mini.setup({
  draw = {
    delay = 100,
    animation = function() return 20 end,
  },
  mappings = {},
  options = {
    border = "both",
    indent_at_cursor = true,
    try_as_border = false,
  },
  symbol = MainConfig.ui.small.scope,
})

-- vim:filetype=lua
