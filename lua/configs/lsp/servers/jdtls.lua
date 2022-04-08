local schema = {
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

return schema
