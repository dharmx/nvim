return {
  {
    "numToStr/Comment.nvim",
    keys = { "g", { mode = "v", "g" }, { mode = "i", "g" }, { mode = "x", "g" } },
    config = function()
      require("plugins.coding.comments")
    end,
  },
  {
    "monaqa/dial.nvim",
    keys = { mode = "n", { "<C-a>", "<C-x>", "<C-a>", "<C-x>" } },
    config = function()
      require("plugins.coding.dial")
    end,
  },
  {
    "itchyny/vim-highlighturl",
    event = "CursorMoved",
  },
  {
    "tyru/open-browser.vim",
    event = "CmdlineEnter"
  },
  {
    "fedepujol/move.nvim",
    opts = {
      line = {
        enable = true,
        indent = true,
      },
      block = {
        enable = true,
        indent = true,
      },
      word = {
        enable = true,
      },
      char = {
        enable = true,
      }
    },
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "mbbill/undotree",
    init = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_ShortIndicators = 0
      vim.g.undotree_DiffpanelHeight = 10
      vim.g.undotree_DiffAutoOpen = 1
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_TreeNodeShape = "*"
      vim.g.undotree_TreeVertShape = "|"
      vim.g.undotree_TreeSplitShape = "/"
      vim.g.undotree_TreeReturnShape = "\\"
      vim.g.undotree_DiffCommand = "diff"
      vim.g.undotree_RelativeTimestamp = 1
      vim.g.undotree_HighlightChangedText = 1
      vim.g.undotree_HighlightChangedWithSign = 1
      vim.g.undotree_HighlightSyntaxAdd = "DiffAdd"
      vim.g.undotree_HighlightSyntaxChange = "DiffChange"
      vim.g.undotree_HighlightSyntaxDel = "DiffDelete"
      vim.g.undotree_HelpLine = 1
      vim.g.undotree_CursorLine = 1
    end,
    cmd = "UndotreeToggle",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_context_pdf_viewer = "zathura"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "",
        out_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
          "-pdf",
        },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = true,
    event = "CmdlineEnter",
  },
  {
    "tpope/vim-repeat",
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
}
