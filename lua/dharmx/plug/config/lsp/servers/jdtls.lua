local schema = {
  root_dir = require("lspconfig.util").root_pattern({ ".git", "mvnw", "gradlew", ".idea", "*.iml" }) or vim.loop.cwd(),
  settings = {
    java = {
      signatureHelp = {
        enabled = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

return schema

-- vim:filetype=lua
