local ok, lightbulb = pcall(require, "nvim-lightbulb")
if not ok then return end

lightbulb.setup({
  ignore = {
    actions_without_kind = false,
  },
  sign = {
    enabled = true,
    priority = 10,
    text = "┃"
  },
  float = {
    enabled = false,
    text = " Code actions available",
    win_opts = {
      border = "solid",
    },
  },
  virtual_text = {
    enabled = true,
    text = "",
    hl_mode = "replace",
  },
  status_text = {
    enabled = true,
    text = "Actions",
    text_unavailable = "None",
  },
})
