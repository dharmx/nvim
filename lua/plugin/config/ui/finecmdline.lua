local present, fine_cmdline = pcall(require, "fine-cmdline")

if not present then
  return
end

local config = {
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = "   ",
  },
  popup = {
    position = {
      row = "20%",
      col = "50%",
    },
    size = {
      width = "60%",
    },
    border = {
      style = { " ", " ", " ", " ", " ", " ", " ", " " },
      padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
      },
      text = {
        bottom_align = "center",
        bottom = "",
      },
    },
    win_options = {
      winhighlight = "TabLine:Boolean,FloatBorder:FloatBorder",
    },
    buf_options = {
      filetype = "cmdline",
    },
  },
}

fine_cmdline.setup(config)

-- vim:ft=lua
