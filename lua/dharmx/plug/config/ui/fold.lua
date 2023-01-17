local ok, fold = pcall(require, "pretty-fold")
if not ok then return end
local MainConfig = require("dharmx")

fold.setup({
  sections = {
    left = {
      "content",
    },
    right = {
      MainConfig.ui.fold.number_of_folded_lines,
      "number_of_folded_lines",
      MainConfig.ui.fold.percentage,
      "percentage",
      MainConfig.ui.fold.padding,
      function(config) return config.fill_char:rep(3) end,
    },
  },
  fill_char = MainConfig.ui.fold.fill_char,
  remove_fold_markers = true,
  keep_indentation = true,
  process_comment_signs = "spaces",
  comment_signs = {},
  stop_words = { "@brief%s*" },
  add_close_pattern = true,
  matchup_patterns = {
    { "{", "}" },
    { "%(", ")" },
    { "%[", "]" },
  },
  ft_ignore = MainConfig.black.filetype,
})

-- vim:filetype=lua
