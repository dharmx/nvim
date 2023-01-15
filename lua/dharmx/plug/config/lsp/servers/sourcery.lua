local env = io.open(vim.fn.stdpath("data") .. "/.sourcery")

local schema = {
  settings = {
    sourcery = {
      metricsEnabled = true,
    },
  },
}

if env then
  schema.init_options = {}
  schema.init_options.token = vim.split(env:read(), "=", { plain = true })[2]
  env:close()
end

return schema

-- vim:filetype=lua
