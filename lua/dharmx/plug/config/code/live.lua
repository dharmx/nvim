local ok, live = pcall(require, "live_server")
if not ok then return end

live.setup({
  port = 8080,
  browser_command = "firefox",
  quiet = true,
  no_css_inject = true,
})
