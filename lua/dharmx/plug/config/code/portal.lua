local ok, portal = pcall(require, "portal")
if not ok then return end

portal.setup(require("portal").setup({
  log_level = "warn",
  query = { "modified", "different", "valid" },
  labels = { "j", "k", "h", "l" },
  escape = {
    ["<esc>"] = true,
  },
  lookback = 100,
  portal = {
    title = {
      render_empty = true,
      options = {
        relative = "cursor",
        width = 80,
        height = 1,
        col = 2,
        style = "minimal",
        focusable = false,
        border = "solid",
        noautocmd = true,
        zindex = 98,
      },
    },
    body = {
      render_empty = false,
      options = {
        relative = "cursor",
        width = 80,
        height = 3,
        col = 2,
        focusable = true,
        border = "solid",
        noautocmd = true,
        zindex = 99,
      },
    },
  },
}))

-- vim:filetype=lua
