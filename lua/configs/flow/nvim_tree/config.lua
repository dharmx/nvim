local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local config = {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = nil,
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = { enable = true, auto_open = false },
  diagnostics = {
    enable = true,
    icons = { hint = " ", info = " ", warning = " ", error = " " },
  },
  update_focused_file = { enable = true, update_cwd = true, ignore_list = nil },
  system_open = { cmd = nil, args = nil },
  filters = { dotfiles = false, custom = nil },
  git = { enable = true, ignore = false, timeout = 500 },
  view = {
    width = 35,
    hide_root_folder = false,
    side = "left",
    auto_resize = true,
    mappings = { custom_only = false, list = nil },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    italic_comments = false,
    transparency = true,
  },
  trash = { cmd = "trash", require_confirm = true },
}

nvimtree.setup(config)
