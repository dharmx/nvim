local function req(file) require("dharmx.plug.config.code." .. file) end

return {
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
  },
  {
    "aurum77/live-server.nvim",
    build = function()
      require("live_server.util").install()
    end,
    config = function()
      req("live")
    end,
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
    "ThePrimeagen/harpoon",
    config = function() req("harpoon") end,
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
    "is0n/jaq-nvim",
    config = function() req("jaq") end,
    cmd = "Jaq",
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
    "MattesGroeger/vim-bookmarks",
    init = function() req("bookmarks") end,
    cmd = "BookmarkToggle",
  },
  {
    "kyazdani42/nvim-tree.lua",
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
    "iamcco/markdown-preview.nvim",
    init = function() req("markdown") end,
    build = "cd app && yarn install",
    ft = "markdown",
  },
  {
    "kshenoy/vim-signature",
    init = function() req("signature") end,
    keys = { "<F4>", { mode = "i", "<F4>" } },
    cmd = "SignatureToggleSigns",
  },
}
