local ok, twilight = pcall(require, "twilight")
if not ok then return end

local config = {
  dimming = {
    alpha = 0.2,
    color = { "Normal", "#ffffff" },
    inactive = true,
  },
  context = 1,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},
}

twilight.setup(config)

-- vim:filetype=lua
