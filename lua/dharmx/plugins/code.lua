local function req(file) require("dharmx.configs.code." .. file) end

return {
  {
    "kylechui/nvim-surround",
    event = { "CmdlineEnter", "InsertEnter", "CursorHold", "CursorMoved" },
    config = true,
  },
  {
    "monaqa/dial.nvim",
    config = function() req("dial") end,
    keys = { mode = "n", { "<C-a>", "<C-x>", "<C-a>", "<C-x>" } },
  },
  {
    "max397574/better-escape.nvim",
    opts = {
      mapping = { "jk", "jj" },
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = "<Esc>",
    },
    event = { "CmdlineEnter", "InsertEnter", "CursorHold", "CursorMoved" },
  },
  {
    "johmsalas/text-case.nvim",
  },
  {
    "tversteeg/registers.nvim",
    config = function() req("registers") end,
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    cmd = "Registers",
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
  },
  {
    "AndrewRadev/linediff.vim",
    cmd = "Linediff",
  },
  {
    "itchyny/vim-highlighturl",
    event = "CursorMoved",
  },
  {
    "tyru/open-browser.vim",
    event = "CursorMoved",
  },
  {
    "aurum77/live-server.nvim",
    build = function() require("live_server.util").install() end,
    opts = {
      port = 8080,
      browser_command = "firefox",
      quiet = true,
      no_css_inject = true,
      install_path = vim.fn.stdpath("state") .. "/live",
    },
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
    "kevinhwang91/rnvimr",
    init = function() req("ranger") end,
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    config = true,
    event = "CmdlineEnter",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() req("toggleterm") end,
    cmd = "ToggleTerm",
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = true,
    event = "CmdlineEnter",
    keys = { "n", "N" },
  },
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
  },
  {
    "kovetskiy/sxhkd-vim",
    ft = "sxhkd",
  },
  {
    "TimUntersberger/neogit",
    opts = {
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
    },
    cmd = "Neogit",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() req("gitsigns") end,
    event = { "CmdlineEnter", "InsertEnter", "CursorHold", "CursorMoved" },
  },
  {
    "numToStr/Comment.nvim",
    config = function() req("comments") end,
    keys = { "g", { mode = "v", "g" }, { mode = "i", "g" }, { mode = "x", "g" } },
  },
  {
    "phelipetls/vim-hugo",
    ft = "markdown",
  },
  {
    "robertbasic/vim-hugo-helper",
    ft = "markdown",
  },
  {
    "matze/vim-move",
    init = function()
      vim.g.move_key_modifier = "M"
      vim.g.move_key_modifier_visualmode = "M"
    end,
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "tpope/vim-repeat",
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
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = {
      auto_load = true,
      close_on_bdelete = true,
      syntax = true,
      theme = "dark",
      update_on_change = true,
      app = vim.env.BROWSER,
      filetype = { "markdown" },
      throttle_at = 200000,
      throttle_time = "auto",
    },
    ft = "markdown",
  },
}
