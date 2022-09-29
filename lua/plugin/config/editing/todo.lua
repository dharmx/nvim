local present, todo = pcall(require, "todo-comments")

if not present then
  return
end

local config = {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
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
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 2500,
    exclude = {},
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

todo.setup(config)

-- vim:ft=lua
