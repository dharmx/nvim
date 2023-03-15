local function req(file) require("dharmx.plug.config.code." .. file) end

return {
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
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
    "cbochs/portal.nvim",
    config = function() req("portal") end,
  },
  {
    "cbochs/grapple.nvim",
    config = function() req("grapple") end,
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
    "hinell/move.nvim",
    config = function() req("move") end,
    cmd = {
      "MoveLine",
      "MoveBlock",
      "MoveHChar",
      "MoveHBlock",
    },
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
    "nvim-tree/nvim-tree.lua",
    config = function() req("nvimtree") end,
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeFocus",
      "NvimTreeResize",
      "NvimTreeToggle",
      "NvimTreeRefresh",
      "NvimTreeCollapse",
      "NvimTreeFindFile",
      "NvimTreeClipboard",
      "NvimTreeFindFileToggle",
      "NvimTreeCollapseKeepBuffers",
    },
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
