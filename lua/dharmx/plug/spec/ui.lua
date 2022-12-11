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
    event = "LspAttach",
  },
  {
    "b0o/incline.nvim",
    config = function() req("incline") end,
    dependencies = { "kyazdani42/nvim-web-devicons", "dharmx/nvim-colo" },
    event = "CursorMoved",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "InsertEnter",
    config = function() req("indentline") end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function() req("scrollbar") end,
    dependencies = { "gitsigns.nvim", "nvim-hlslens" },
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
}

-- vim:filetype=lua
