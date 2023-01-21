local ok, lightbulb = pcall(require, "nvim-lightbulb")
if not ok then return end

lightbulb.setup({
  ignore = { "null-ls" },
  sign = {
    enabled = true,
    priority = 10,
  },
  float = {
    enabled = false,
    text = "ﯦ Code actions available",
    win_opts = {
      border = "solid",
    },
  },
  virtual_text = {
    enabled = true,
    text = "ﮠ",
    hl_mode = "replace",
  },
  status_text = {
    enabled = true,
    text = "Actions",
    text_unavailable = "None",
  },
})

-- vim:filetype=lua
