local ok, peek = pcall(require, "peek")
if not ok then return end

peek.setup({
  auto_load = true,
  close_on_bdelete = true,
  syntax = true,
  theme = "dark",
  update_on_change = true,
  app = "webview",
  filetype = { "markdown" },
  throttle_at = 200000,
  throttle_time = "auto",
})
