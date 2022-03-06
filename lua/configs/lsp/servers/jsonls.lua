local schema = {
  settings = {
    json = {
      schemas = vim.list_extend(
        {
          {
            description = "TypeScript compiler configuration file",
            fileMatch = { "tsconfig.json", "tsconfig.*.json" },
            url = "http://json.schemastore.org/tsconfig",
          },
          {
            description = "Lerna config",
            fileMatch = { "lerna.json" },
            url = "http://json.schemastore.org/lerna",
          },
          {
            description = "Babel configuration",
            fileMatch = {
              ".babelrc.json",
              ".babelrc",
              "babel.config.json",
            },
            url = "http://json.schemastore.org/lerna",
          },
          {
            description = "ESLint config",
            fileMatch = { ".eslintrc.json", ".eslintrc" },
            url = "http://json.schemastore.org/eslintrc",
          },
          {
            description = "Bucklescript config",
            fileMatch = { "bsconfig.json" },
            url = "https://bucklescript.github.io/bucklescript/docson/build-schema.json",
          },
          {
            description = "Prettier config",
            fileMatch = {
              ".prettierrc",
              ".prettierrc.json",
              "prettier.config.json",
            },
            url = "http://json.schemastore.org/prettierrc",
          },
          {
            description = "Vercel Now config",
            fileMatch = { "now.json" },
            url = "http://json.schemastore.org/now",
          },
          {
            description = "Stylelint config",
            fileMatch = {
              ".stylelintrc",
              ".stylelintrc.json",
              "stylelint.config.json",
            },
            url = "http://json.schemastore.org/stylelintrc",
          },
          {
            description = "SumnekoLua config",
            fileMatch = {
              ".sumnekorc.json",
              "sumnekorc.json",
              "sumnekorc",
              ".sumnekorc",
              ".sumnekorc.lua",
              "sumnekorc.lua",
              "sumneko_lua.lua",
              ".luarc.json",
              "luarc.json",
            },
            url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
          },
        },
        require("schemastore").json.schemas {
          select = { ".eslintrc", "package.json" },
        }
      ),
    },
  },
}

return schema
