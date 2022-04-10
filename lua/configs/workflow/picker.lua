local present, picker = pcall(require, "require'window-picker")

if not present then
  return
end

local config = {
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
      -- if the buffer type is one of following, the window will be ignored
      buftype = { "terminal" },
    },
  },
  other_win_hl_color = "#e35e4f",
}

picker.setup(config)
