local ok, ibl = pcall(require, "ibl")
if not ok then return end

ibl.setup({
  indent = {
    char = "│",
  },
  scope = {
    char = "┋",
    highlight = "IndentBlanklineContextChar",
  },
  whitespace = {
    remove_blankline_trail = true,
  },
  exclude = {
    buftypes = {
      "terminal",
      "nofile",
    },
    filetypes = {
      "TelescopeResults",
      "query",
      "tsplayground",
      "lazy",
      "lsp-installer",
      "markdown",
      "mason",
      "txt",
      "text",
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
    }
  },
})

local hooks = require("ibl.hooks")
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
