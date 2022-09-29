local present, schemastore = pcall(require, "schemastore")
local json_schemas = {}

if present then
  json_schemas = schemastore.json.schemas({
    select = { ".eslintrc", "package.json" }
  })
end

local schema = {
  settings = {
    json = {
      schemas = vim.list_extend(
        {
          {
            description = "json-ls configuration file",
            fileMatch = { ".jsonls.json", "jsonls.json" },
            url = "https://gist.githubusercontent.com/tamago324/d09875f231ee4f149ed63766af3cc0ca/raw/ee598f1e8348b94bb5d7a12ef111775679242f21/schema-jsonls.json",
          },
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
        json_schemas
      ),
    },
  },
}

return schema

-- vim:ft=lua
