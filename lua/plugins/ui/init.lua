return {
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = { "CursorMoved", "CursorHold", "InsertEnter" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.ui.indents")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter" },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.ui.bufferline")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "freddiehaddad/feline.nvim",
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
    config = function()
      require("plugins.ui.feline")
    end,
    dev = true,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugins.ui.todo")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = true,
    event = "CmdlineEnter",
    keys = { "n", "N", "/" },
  },
  {
    "petertriho/nvim-scrollbar",
    event = { "InsertEnter", "CursorMoved" },
    config = function()
      require("plugins.ui.scroll")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        yue = {
          icon = "󰀘",
          color = "#B7AE8F",
          cterm_color = "65",
          name = "Yue"
        },
      },
    },
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
      notify.setup(opts)
      vim.notify = notify
      vim.notify_once = notify
    end,
    enabled = false,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
}
