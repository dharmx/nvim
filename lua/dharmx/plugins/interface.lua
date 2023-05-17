local function req(file) require("dharmx.configs.interface." .. file) end

return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function() req("alpha") end,
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
    opts = {
      modes = {
        minimalist = {
          options = {
            statusline = "%{%v:lua.require'feline'.generate_statusline()%}",
            cmdheight = 0,
            laststatus = 0,
          },
        },
      },
    },
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
    "doums/monark.nvim",
    opts = {
      clear_on_normal = true,
      sticky = true,
      offset = 2,
      timeout = 300,
      i_idle_to = 1000,
      modes = {
        normal = { " ", "MonarkNormal" },
        visual = { " ", "MonarkVisual" },
        visual_l = { " ", "MonarkVisualLine" },
        visual_b = { " ", "MonarkVisualBlock" },
        select = { " ", "MonarkSelect" },
        insert = { " ", "MonarkInsert" },
        replace = { " ", "MonarkReplace" },
        terminal = { " ", "MonarkTerminal" },
      },
      hl_mode = "combine",
      ignore = { "c" },
    },
    event = "InsertEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() req("indentline") end,
    event = { "CursorMoved", "CursorHold", "InsertEnter" },
  },
  {
    "RRethy/vim-illuminate",
    config = function() req("illuminate") end,
    event = { "InsertEnter", "CursorMoved" },
  },
}
