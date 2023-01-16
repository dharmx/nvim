local function req(file) require("dharmx.plug.config.work." .. file) end

return {
  { "kevinhwang91/rnvimr", init = function() req("ranger") end },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffViewOpen", "DiffViewClose", "DiffViewToggleFiles" },
    config = function() req("diffview") end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function() req("toggleterm") end,
    keys = [[<C-\>]],
    cmd = "ToggleTerm",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = { "CursorMoved", "CursorMovedI" },
    config = function() req("lens") end,
  },
  {
    "dnlhc/glance.nvim",
    config = function() req("glance") end,
    dependencies = "neovim/nvim-lspconfig",
    cmd = "Glance",
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
    event = { "CursorMoved", "CursorMovedI" },
    config = function() req("gitsigns") end,
  },
  {
    "numToStr/Comment.nvim",
    config = function() req("comments") end,
    event = { "CursorMoved", "InsertEnter" },
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
    config = function() req("trouble") end,
    event = "LspAttach",
  },
  {
    "NFrid/due.nvim",
    cmd = { "DueDraw", "DueRedraw", "DueClean", "DueAsyncUpdate" },
  },
  { "phelipetls/vim-hugo", ft = "markdown" },
  { "robertbasic/vim-hugo-helper", ft = "markdown" },
  {
    "hinell/move.nvim",
    event = "InsertEnter",
    config = function() req("move") end,
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  { "tpope/vim-repeat", lazy = true },
  {
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    config = function() req("leap") end,
    lazy = true,
  },
  {
    "ggandor/flit.nvim",
    config = function() req("flit") end,
    event = { "CursorHold", "CursorMoved" },
  },
  {
    "MattesGroeger/vim-bookmarks",
    init = function() req("bookmarks") end,
    event = { "CursorHold", "CursorMoved" },
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
    config = function() req("nvimtree") end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function() req("undotree") end,
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
    keys = { "<leader>" },
  },
}

-- vim:filetype=lua
