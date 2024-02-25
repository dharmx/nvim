local function req(file) require("dharmx.configs.interface." .. file) end

return {
  {
    "Bekaboo/deadcolumn.nvim",
    opts = {
      scope = "line",
      blending = {
        hlgroup = { "ColorColumn", "bg" },
      },
      warning = {
        hlgroup = { "CursorLine", "bg" },
      },
    },
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "freddiehaddad/feline.nvim",
    config = function() req("feline-lone") end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          yue = {
            icon = "󰀘",
            color = "#B7AE8F",
            cterm_color = "65",
            name = "Yue"
          },
        }
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function() req("scrollbar") end,
    event = { "InsertEnter", "CursorMoved" },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
      on_open = nil,
      on_close = nil,
      render = "default",
      timeout = 3500,
      max_width = 150,
      max_height = 25,
      background_colour = "TabLine",
      minimum_width = 50,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "",
      },
    },
    config = function(_, opts)
      local notify = require("notify")
      vim.notify = notify
      vim.notify_once = notify
      notify.setup(config)
    end,
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
    enabled = false,
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
