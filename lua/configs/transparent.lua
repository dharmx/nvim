local present, transparent = pcall(require, "transparent")

if not present then
  return
end

local config = {
  enable = false,
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {},
}

transparent.setup(config)

-- vim:ft=lua
