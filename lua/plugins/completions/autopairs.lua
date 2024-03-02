local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then return end

autopairs.setup({
  check_ts = true,
  close_triple_quotes = true,
  disable_filetype = {
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
})

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

autopairs.add_rules({
  Rule(" ", " ")
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ "()", "{}", "[]" }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ "(  )", "{  }", "[  ]" }, context)
    end),
  Rule("", " )")
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ")" end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(")"),
  Rule("", " }")
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == "}" end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key("}"),
  Rule("", " ]")
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == "]" end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key("]"),
})

autopairs.add_rules({
  Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
    :use_regex(true)
    :set_end_pair_length(2),
})

autopairs.add_rule(Rule("$", "$", "tex"))
