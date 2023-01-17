local MainConfig = require("dharmx")

vim.g.bookmark_highlight_lines = 1
vim.g.bookmark_no_default_key_mappings = 1
vim.g.bookmark_sign = MainConfig.ui.bookmark.sign
vim.g.bookmark_annotation_sign = MainConfig.ui.bookmark.annotation
vim.g.bookmark_auto_save_file = vim.fn.stdpath("state") .. "/bookmarks.txt"

-- vim:filetype=lua
