local ok, scrollbar = pcall(require, "scrollbar")
if not ok then return end

scrollbar.setup({
  show = true,
  show_in_active_only = false,
  set_highlights = false,
  folds = 1000,
  max_lines = false,
  handle = {
    text = " ",
    hide_if_all_visible = true,
  },
  marks = {
    Search = {
      text = { "-", "=" },
      priority = 0,
    },
    Error = {
      text = { "-", "=" },
      priority = 1,
    },
    Warn = {
      text = { "-", "=" },
      priority = 2,
    },
    Info = {
      text = { "-", "=" },
      priority = 3,
    },
    Hint = {
      text = { "-", "=" },
      priority = 4,
    },
    Misc = {
      text = { "-", "=" },
      priority = 5,
    },
    GitAdd = {
      text = "▁",
      priority = 5,
    },
    GitChange = {
      text = "▁",
      priority = 5,
    },
    GitDelete = {
      text = "▁",
      priority = 5,
    },
  },
  excluded_buftypes = {
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
  excluded_filetypes = {
    "terminal",
    "nofile",
  },
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    diagnostic = true,
    search = true,
    gitsigns = true,
  },
})

-- vim:filetype=lua
