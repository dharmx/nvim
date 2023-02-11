local ok, notify = pcall(require, "notify")
if not ok then return end

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

vim.notify = function(message, ...)
  if message ~= "nvim-treesitter.ts_utils.is_in_node_range is deprecated: use vim.treesitter.is_in_node_range" then
    notify(message, ...)
  end
end
vim.notify_once = vim.notify
notify.setup(config)

-- vim:filetype=lua
