return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.config")
    end,
    cmd = "LspStart",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      install_root_dir = vim.fn.stdpath("data") .. "/servers",
      max_concurrent_installers = 10,
      border = "solid",
      pip = { upgrade_pip = true },
      ui = {
        icons = {
          package_installed = " ",
          package_pending = " ",
          package_uninstalled = "◍ ",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "intelephense",
        "texlab",
        "jsonls",
        "pyright",
        "lua_ls",
        "emmet_ls",
        "grammarly",
        "vimls",
        "clangd",
        "sourcery",
      },
      automatic_installation = true,
    },
  },
  {
    "folke/neoconf.nvim",
    event = "LspAttach",
    opts = {
      local_settings = ".lua.json",
      global_settings = "lua.json",
      import = {
        vscode = true,
        coc = true,
        nlsp = true,
      },
      live_reload = true,
      filetype_jsonc = true,
      plugins = {
        lspconfig = {
          enabled = true,
        },
      },
    },
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = { "plenary.nvim", "telescope.nvim" },
      },
      setup_jsonls = true,
      lspconfig = true,
      pathStrict = true,
    },
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      icons = require("core.kinds"),
      highlight = true,
      depth_limit = 0,
      separator = "  ",
      depth_limit_indicator = "… ",
      safe_output = true,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    },
  },
}
