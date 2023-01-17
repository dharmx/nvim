local function req(file) require("dharmx.plug.config.ui." .. file) end

return {
  {
    "akinsho/bufferline.nvim",
  },
  {
    "kyazdani42/nvim-web-devicons",
  },
  {
    "goolord/alpha-nvim",
  },
  {
    "feline-nvim/feline.nvim",
  },
  {
    "b0o/incline.nvim",
    config = function() require("dharmx.plug.config.ui.incline") end,
    event = { "InsertEnter", "CursorHold", "CursorMoved" },
  },
  {
    "lukas-reineke/virt-column.nvim",
    config = function() req("virtcolumn") end,
    event = { "CursorMoved", "CursorHold" },
  },
  {
    "petertriho/nvim-scrollbar",
    config = function() req("scrollbar") end,
    event = { "InsertEnter", "CursorMoved" },
  },
  {
    "folke/twilight.nvim",
    config = function() req("twilight") end,
    cmd = "Twilight",
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist", "TZNarrow" },
  },
  {
    "rcarriga/nvim-notify",
    config = function() req("notify") end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "folke/todo-comments.nvim",
    config = function() req("todo") end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "NvChad/nvim-colorizer.lua",
    keys = { "<F3>", { mode = "i", "<F3>" } },
  },
  {
    "yamatsum/nvim-cursorline",
    config = function() req("cursorline") end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = function() req("fold") end,
    keys = { "zf", "zd", "za" },
  },
  {
    "doums/monark.nvim",
    config = function() req("monark") end,
    event = "InsertEnter",
    dev = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() req("indentline") end,
    event = { "CursorMoved", "CursorHold", "InsertEnter" },
  },
  {
    "echasnovski/mini.indentscope",
    config = function() req("indentscope") end,
  },
  {
    "RRethy/vim-illuminate",
    config = function() req("illuminate") end,
    event = { "InsertEnter", "CursorHold", "CursorMoved" },
  },
  {
    "gorbit99/codewindow.nvim",
    config = function() req("codewindow") end,
    event = "LspAttach",
  },
}

-- vim:filetype=lua
