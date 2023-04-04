local function req(file) require("dharmx.plug.config.code." .. file) end

return {
  {
    "monaqa/dial.nvim",
    config = function() req("dial") end,
    keys = { mode = "n", { "<C-a>", "<C-x>", "<C-a>", "<C-x>" } }
  },
  {
    "max397574/better-escape.nvim",
    config = function() req("escape") end,
    event = { "CmdlineEnter", "InsertEnter", "CursorHold", "CursorMoved" },
  },
  {
    "johmsalas/text-case.nvim",
  },
  {
    "Wansmer/treesj",
  },
  {
    "tversteeg/registers.nvim",
    config = function() req("registers") end,
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
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
    config = function() req("live") end,
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
  },
  {
    "kevinhwang91/rnvimr",
    init = function() req("ranger") end,
    lazy = false,
  },
  {
    "stevearc/overseer.nvim",
    config = function() req("overseer") end,
  },
  {
    "stevearc/resession.nvim",
    config = function() req("resession") end,
  },
  {
    "stevearc/aerial.nvim",
    config = function() req("aerial") end,
    cmd = {
      "AerialToggle",
      "AerialOpen",
      "AerialOpenAll",
      "AerialClose",
      "AerialCloseAll",
      "AerialNext",
      "AerialPrev",
      "AerialGo",
      "AerialInfo",
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function() req("refactoring") end,
  },
  {
    "sindrets/diffview.nvim",
    config = function() req("diffview") end,
    event = "CmdlineEnter",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() req("toggleterm") end,
    cmd = "ToggleTerm",
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function() req("lens") end,
    event = "CmdlineEnter",
    keys = { "n", "N" },
  },
  {
    "dnlhc/glance.nvim",
    config = function() req("glance") end,
    event = "LspAttach",
  },
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
  },
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },
  {
    "kovetskiy/sxhkd-vim",
    ft = "sxhkd",
  },
  {
    "MTDL9/vim-log-highlighting",
    ft = { "txt", "text", "log" },
  },
  {
    "TimUntersberger/neogit",
    config = function() req("neogit") end,
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
    "folke/trouble.nvim",
    config = function() req("trouble") end,
    event = "LspAttach",
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
      -- vim.g.move_map_keys = 0
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
    "ggandor/leap.nvim",
    config = function() req("leap") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "ggandor/flit.nvim",
    config = function() req("flit") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "mbbill/undotree",
    config = function() req("undotree") end,
    cmd = "UndotreeToggle",
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function() req("peek") end,
    ft = "markdown",
  },
  {
    "chentoast/marks.nvim",
    config = function() req("marks") end,
    event = { "CursorHold", "CursorMoved" },
  },
}
