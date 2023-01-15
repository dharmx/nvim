local function req(file) require("dharmx.plug.config.work." .. file) end

return {
  { "kevinhwang91/rnvimr", init = function() req("rnvim") end },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffViewOpen", "DiffViewClose", "DiffViewToggleFiles" },
    config = function() req("diffview") end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() req("toggleterm") end,
    lazy = true,
    cmd = "ToggleTerm",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    config = function() req("hlslens") end,
  },
  {
    "dnlhc/glance.nvim",
    config = function() req("glance") end,
    dependencies = "neovim/nvim-lspconfig",
  },
  { "Fymyte/rasi.vim", ft = "rasi" },
  { "elkowar/yuck.vim", ft = "yuck" },
  { "kovetskiy/sxhkd-vim", ft = "sxhkd" },
  { "MTDL9/vim-log-highlighting", ft = "log" },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function() req("neogit") end,
  },
  {
    "lewis6991/gitsigns.nvim",
    cmd = "Gitsigns",
    config = function() req("gitsigns") end,
  },
  {
    "numToStr/Comment.nvim",
    config = function() req("comments") end,
    event = { "CursorMoved", "InsertEnter" },
  },
  {
    "folke/todo-comments.nvim",
    event = { "CmdlineEnter", "InsertEnter", "CursorMoved" },
    config = function() req("todo") end,
  },
  {
    "iamcco/markdown-preview.nvim",
    init = function() req("mdpreview") end,
    build = "cd app && yarn install",
    ft = "markdown",
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = {
      "ColorizerToggle",
      "ColorizerReloadAllBuffers",
      "ColorizerAttachToBuffers",
      "ColorizerDetachFromBuffers",
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
    config = function() req("trouble") end,
  },
  {
    "NFrid/due.nvim",
    cmd = { "DueDraw", "DueRedraw", "DueClean", "DueAsyncUpdate" },
  },
  { "phelipetls/vim-hugo", ft = "markdown" },
  { "robertbasic/vim-hugo-helper", ft = "markdown" },
  {
    "yamatsum/nvim-cursorline",
    config = function() req("cursorline") end,
  },
  {
    "hinell/move.nvim",
    event = "InsertEnter",
    config = function() req("move") end,
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  { "tpope/vim-repeat" },
  {
    "ggandor/leap.nvim",
    config = function() require("leap") end,
    dependencies = "tpope/vim-repeat",
  },
}

-- vim:filetype=lua
