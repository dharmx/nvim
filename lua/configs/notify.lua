local present, notify = pcall(require, "notify")

if not present then
  return
end

local config = {
  stages = "fade_in_slide_out",
  on_open = nil,
  on_close = nil,
  render = "default",
  timeout = 3500,
  max_width = 150,
  max_height = 25,
  background_colour = "TabLine",
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "",
  },
}

vim.notify = notify
notify.setup(config)

-- vim:ft=lua
