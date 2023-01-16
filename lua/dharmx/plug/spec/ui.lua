local function req(file) require("dharmx.plug.config.ui." .. file) end

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  {
    "goolord/alpha-nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    cmd = { "Alpha", "AlphaRedraw" },
  },
  {
    "feline-nvim/feline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function() req("virtcolumn") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "b0o/incline.nvim",
    config = function() req("incline") end,
    dependencies = { "kyazdani42/nvim-web-devicons", "dharmx/nvim-colo" },
    event = "InsertEnter",
  },
  {
    "petertriho/nvim-scrollbar",
    config = function() req("scrollbar") end,
    dependencies = { "gitsigns.nvim", "nvim-hlslens" },
    event = { "CursorHold", "CursorMoved" },
  },
  {
    "sunjon/shade.nvim",
    config = function() req("shade") end,
    keys = { "<leader>s" },
    cmd = "Shade",
  },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function() req("twilight") end,
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
  },
  {
    "rcarriga/nvim-notify",
    event = "InsertEnter",
    config = function() req("notify") end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "CmdlineEnter", "InsertEnter", "CursorMoved" },
    config = function() req("todo") end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    keys = { "<F3>" },
  },
  {
    "yamatsum/nvim-cursorline",
    config = function() req("cursorline") end,
    lazy = true,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = function() req("fold") end,
    keys = { "zf", "za", "zc" },
  },
  {
    "doums/monark.nvim",
    config = function() req("monark") end,
    event = "InsertEnter",
    dev = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "CursorMoved", "CursorHold" },
    config = function() req("indentline") end,
  },
  {
    "RRethy/vim-illuminate",
    config = function() req("illuminate") end,
    event = { "CursorHold", "CursorMoved" },
  },
}

-- vim:filetype=lua
