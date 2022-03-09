local schema = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = require("lspconfig.util").root_pattern {
    ".git",
    "stylua.toml",
    ".stylua.toml",
  } or vim.loop.cwd,
  settings = {
    Lua = {
      IntelliSense = {
        traceBeSetted = true,
        traceFieldInject = true,
        traceLocalSet = true,
        traceReturn = true,
      },
      runtime = {
        version = "LuaJIT",
        path = {
          vim.split(package.path, ";"),
          "lua/?.lua",
          "lua/?/init.lua",
        },
        fileEncoding = "utf8",
      },
      diagnostics = {
        enable = true,
        disable = { "lowercase-global" },
        globals = { "hs", "vim" },
        ignoredFiles = "Opened",
        libraryFiles = "Opened",
        workspaceDelay = 3000,
        workspaceRate = 100,
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = true,
        ignoreDir = { ".vscode" },
        ignoreSubmodules = true,
        maxPreload = 5000,
        preloadFileSize = 500,
        useGitIgnore = true,
      },
      telemetry = { enable = false },
      completion = {
        enable = true,
        autoRequire = true,
        callSnippet = "Replace",
        keywordSnippet = "Replace",
        postfix = "@",
        requireSeparator = true,
        showParams = true,
        displayContext = 1,
        showWord = "Enable",
        workspaceWord = true,
      },
      hint = {
        arrayIndex = "Auto",
        enable = true,
        paramName = "All",
        paramType = true,
        setType = false,
      },
      hover = {
        enable = true,
        enumsLimit = 5,
        previewFields = 20,
        viewNumber = true,
        viewString = true,
        viewStringMax = 1000,
      },
      misc = { parameters = { "self" } },
      semantic = {
        annotation = true,
        enable = true,
        keyword = true,
        variable = true,
      },
      window = { progressBar = true, statusBar = true },
      format = { enable = true },
    },
  },
  single_file_support = true,
}

return schema

-- vim:ft=lua
