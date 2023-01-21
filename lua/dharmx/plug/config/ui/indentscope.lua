local ok, mini = pcall(require, "mini.indentscope")
if not ok then return end

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
  symbol = "┃",
})

-- vim:filetype=lua
