local M = {}

M._loaded = false
M._config = {
  c = {
    spacing = " ",
    head = "/**",
    body = "*",
    tail = "*/",
  },
  rust = {
    spacing = " ",
    head = "///",
    body = "///",
    tail = "///",
  },
  lua = {
    spacing = "",
    head = "---",
    body = "---",
    tail = "---",
  },
}

function M.setup(options)
  options = vim.F.if_nil(options, {})
  M._config = vim.tbl_deep_extend("keep", options, M._config)
  M._loaded = true
end

function M.generate(language, params, metadata, on_complete)
  assert(M._loaded, "run setup first.")
  metadata = vim.F.if_nil(metadata, {
    "This is metadata.",
    "",
    date = os.date,
    license = "GPL-3.0",
  })

  language = vim.F.if_nil(language, vim.bo.filetype)
  if not M._config[language] then
    assert(params and params.body, "params.[_|body] ~= nil.")
  end
  params = vim.F.if_nil(params, M._config[language])
  params.spacing = vim.F.if_nil(params.spacing, "")

  local full = {}
  if params.head then table.insert(full, params.head) end
  for param, value in pairs(metadata) do
    ---@diagnostic disable-next-line: cast-local-type
    if type(value) == "function" then value = value() end
    if type(param) == "number" then
      table.insert(full, string.format("%s%s%s", params.body, params.spacing, value))
    else
      table.insert(full, string.format("%s%s@%s %s", params.body, params.spacing, param, value))
    end
  end
  if params.tail then table.insert(full, params.tail) end

  if not on_complete then
    vim.api.nvim_put(full, "l", true, false)
    return
  end
  assert(type(on_complete) == "function", "on_complete needs to be a function")
  on_complete(full)
end

return M
