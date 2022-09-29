local env = io.open(vim.fn.stdpath("config") .. "/.sourcery")

local schema = {
  settings = {
    sourcery = {
      metricsEnabled = true,
    },
  },
}

if env then
  schema.init_options = {}
  schema.init_options.token = vim.split(env:read(), "=")[2]
  env:close() 
end

return schema

-- vim:ft=lua
