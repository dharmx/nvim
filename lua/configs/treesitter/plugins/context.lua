local present, context = pcall(require, "treesitter-context")

if not present then
  return
end

local config = {
  enable = false,
  throttle = true,
  max_lines = 0,
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
    -- Example for a specific filetype.
    --   rust = {
    --       'impl_item',
    --   },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },
}

context.setup(config)
