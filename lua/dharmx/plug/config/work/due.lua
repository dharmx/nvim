local ok, due = pcall(require, "due")
if not ok then return end

due.setup({
  prescript = "due: ",
  prescript_hi = "Comment",
  due_hi = "String",
  ft = "*.md",
  today = "TODAY",
  today_hi = "Character",
  overdue = "OVERDUE",
  overdue_hi = "Error",
  date_hi = "Conceal",
  pattern_start = "<",
  pattern_end = ">",
  use_seconds = false,
  default_due_time = "midnight",
})

-- vim:filetype=lua
