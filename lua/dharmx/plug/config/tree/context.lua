local ok, context = pcall(require, "treesitter-context")
if not ok then return end

local config = {
  enable = true,
  throttle = true,
  max_lines = 20,
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
  },
}

context.setup(config)

-- vim:filetype=lua
