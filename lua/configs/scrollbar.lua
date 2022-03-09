local g = vim.g

g.scrollbar_max_size = 10
g.scrollbar_min_size = 3
g.scrollbar_right_offset = 1

g.scrollbar_shape = { head = "█", body = "█", tail = "█" }
g.scrollbar_highlight = { head = "LineNr", body = "LineNr", tail = "LineNr" }

g.scrollbar_excluded_filetypes = {
  "nerdtree",
  "tagbar",
  "dashboard",
  "terminal",
  "Trouble",
  "Outline",
}
g.scrollbar_width = 1
g.scrollbar_winblend = 0

-- vim:ft=lua
