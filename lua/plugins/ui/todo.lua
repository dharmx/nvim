local ok, todo = pcall(require, "todo-comments")
if not ok then return end

todo.setup({
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
    NOTE = { icon = " ", alt = { "INFO", "DEBUG" } },
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
    exclude = {
      "TelescopeResults",
      "query",
      "tsplayground",
      "lazy",
      "lsp-installer",
      "markdown",
      "mason",
      "txt",
      "dashboard",
      "alpha",
      "NvimTree",
      "undotree",
      "diff",
      "fugitive",
      "fugitiveblame",
      "Outline",
      "SidebarNvim",
      "packer",
      "lsp-installer",
      "TelescopePrompt",
      "help",
      "telescope",
      "lspinfo",
      "Trouble",
      "null-ls-info",
      "quickfix",
      "chadtree",
      "fzf",
      "NeogitStatus",
      "terminal",
      "console",
      "term://*",
      "Term://*",
      "toggleterm",
      "qf",
      "prompt",
      "noice",
      "",
    },
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
})
