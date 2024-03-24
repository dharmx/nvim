return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "nvimtools/none-ls.nvim",
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
    "nvimtools/none-ls.nvim",
    config = function() require("plugins.lsp.none") end,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "jayp0521/mason-null-ls.nvim",
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
    "jayp0521/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "autopep8",
        "sql-formatter",
        "isort",
        "stylua",
        "markdownlint",
        "sqlfluff",
        "stylelint",
        "shellcheck",
        "vint",
        "prettier",
        "black",
        "shellharden",
        "gitlint",
        "shfmt",
      },
      automatic_installation = true,
      automatic_setup = true,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shellcheck",
        "shfmt",
        "vint",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
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
}
