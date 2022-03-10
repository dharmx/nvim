local present, searchbox = pcall(require, "searchbox")

if not present then
  return
end

local config = {
  popup = {
    relative = "win",
    position = {
      row = "3%",
      col = "95%",
    },
    size = "20%",
    border = {
      style = "single",
      highlight = "FloatBorder",
      text = {
        bottom = "▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃",
        bottom_align = "center",
        top = "",
      },
    },
    win_options = {
      winhighlight = "TabLine:Boolean",
    },
  },
  hooks = {
    before_mount = function(input)
      api.nvim_set_keymap("n", "/", ":SearchBoxIncSearch<CR>", { noremap = true })
      api.nvim_set_keymap("x", "/", ":SearchBoxIncSearch visual_mode=true<CR>", { noremap = true })
    end,
    after_mount = function(input) end,
    on_done = function(value, search_type) end,
  },
}

searchbox.setup(config)

-- vim:ft=lua
