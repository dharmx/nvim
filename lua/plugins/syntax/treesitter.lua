local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/parsers")

treesitter.setup({
  ensure_installed = {
    "lua",
    "regex",
    "scheme",
    "racket",
    "gitignore",
    "gitcommit",
    "gitattributes",
    "sxhkdrc",
    "python",
    "make",
    "json",
    "todotxt",
    "c",
    "vimdoc",
    "rust",
    "awk",
    "jq",
    "vim",
    "markdown",
    "markdown_inline",
    "git_rebase",
    "css",
    "ini",
    "rasi",
    "html",
    "scss",
    "toml",
    "http",
    "diff",
    "json",
    "yaml",
    "java",
    "json",
    "bash",
    "query",
  },
  auto_install = true,
  ignore_install = { "comment" },
  parser_install_dir = vim.fn.stdpath("data") .. "/parsers",
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  incremental_selection = { enable = true },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["sn"] = "@parameter.inner" },
      swap_previous = { ["sp"] = "@parameter.inner" },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = "solid",
      peek_definition_code = {
        [";df"] = "@function.outer",
        [";dF"] = "@class.outer",
      },
    },
  },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
  },
  matchup = {
    enable = true,
    disable = {
      "ruby",
    },
  },
  querylinter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})
