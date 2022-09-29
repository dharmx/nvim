local g = vim.g

g.bookmark_sign = ""
g.bookmark_highlight_lines = 1
g.bookmark_no_default_key_mappings = 1
g.bookmark_annotation_sign = ""
g.bookmark_auto_save_file = vim.fn.stdpath("data") .. "/bookmarks.txt"

-- vim:ft=lua
