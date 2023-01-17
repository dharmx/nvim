local ok, glance = pcall(require, "glance")
if not ok then return end
local MainConfig = require("dharmx")
local actions = glance.actions

glance.setup({
  height = 20,
  zindex = 45,
  preview_win_opts = {
    cursorline = true,
    number = true,
    wrap = false,
  },
  border = {
    enable = true,
    top_char = MainConfig.ui.glance.top_char,
    bottom_char = MainConfig.ui.glance.bottom_char,
  },
  list = {
    position = "right",
    width = 0.33,
  },
  theme = {
    enable = true,
    mode = "brighten",
  },
  mappings = {
    list = {
      ["j"] = actions.next,
      ["k"] = actions.previous,
      ["<Down>"] = actions.next,
      ["<Up>"] = actions.previous,
      ["<Tab>"] = actions.next_location,
      ["<S-Tab>"] = actions.previous_location,
      ["<C-u>"] = actions.preview_scroll_win(5),
      ["<C-d>"] = actions.preview_scroll_win(-5),
      ["v"] = actions.jump_vsplit,
      ["s"] = actions.jump_split,
      ["t"] = actions.jump_tab,
      ["<CR>"] = actions.jump,
      ["o"] = actions.jump,
      ["<leader>l"] = actions.enter_win("preview"),
      ["q"] = actions.close,
      ["Q"] = actions.close,
      ["<Esc>"] = actions.close,
    },
    preview = {
      ["Q"] = actions.close,
      ["<Tab>"] = actions.next_location,
      ["<S-Tab>"] = actions.previous_location,
      ["<leader>l"] = actions.enter_win("list"),
    },
  },
  indent_lines = {
    enable = true,
    icon = MainConfig.ui.glance.indent,
  },
  winbar = {
    enable = true,
  },
})

-- vim:filetype=lua
