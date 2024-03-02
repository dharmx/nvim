return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.ui.indents")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter" },
  },
  {
    "freddiehaddad/feline.nvim",
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
    config = function()
      require("plugins.ui.feline")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.ui.bufferline")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugins.ui.todo")
    end,
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      wilder.set_option("pipeline", {
        wilder.branch(wilder.cmdline_pipeline({ fuzzy = 0, set_pcre2_pattern = 1 }), wilder.search_pipeline({
          pattern = wilder.python_fuzzy_pattern(),
          sorter = wilder.python_difflib_sorter(),
          engine = "re",
        }))
      })
      wilder.set_option("renderer", wilder.wildmenu_renderer({ highlighter = wilder.basic_highlighter() }))
    end,
    event = "CmdlineEnter",
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = true,
    event = "CmdlineEnter",
    keys = { "n", "N" },
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
    event = { "CursorMoved", "CursorHold", "InsertEnter", "CmdlineEnter" },
  },
}
