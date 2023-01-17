local ok, todo = pcall(require, "todo-comments")
if not ok then return end
local MainConfig = require("dharmx")

local config = {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = { icon = " ", alt = { "FIXME", "FIXIT", "ISSUE" } },
    BUG = { icon = " " },
    TODO = { icon = " " },
    WANTS = { icon = " ", alt = { "REQ", "DEPENDS" } },
    HACK = { icon = " " },
    CHORE = { icon = " " },
    CLEAN = { icon = " ", alt = { "ORGANISE", "ORGANIZE", "CLEANED" } },
    WARN = { icon = " ", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", alt = { "INFO" } },
    UPDATE = { icon = " ", alt = { "MIGRATE" } },
    DEMO = { icon = " ", alt = { "SHOW" } },
    IMPROVE = { icon = " ", alt = { "REFINE", "ENHANCE" } },
    TEST = { icon = "ﭧ", alt = { "MOCK", "UNITTEST", "UNIT" } },
  },
  merge_keywords = true,
  highlight = {
    before = "",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 2500,
    exclude = MainConfig.black.filetype,
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]],
  },
}

for name, _ in ipairs(config.keywords) do
  config.keywords[name].icon = vim.F.if_nil(MainConfig.ui.todo[name], "+")
end

todo.setup(config)

-- vim:filetype=lua
