local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

-- press g? to show nvimtree shortcuts
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" })
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_icon_padding = " "
g.nvim_tree_symlink_arrow = " 壟 "
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_create_in_closed_folder = 1
g.nvim_tree_special_files = { ["README.md"] = 1, ["Makefile"] = 1, ["MAKEFILE"] = 1 }
g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 1 }
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    deleted = "",
    ignored = "",
    renamed = "",
    staged = "",
    unmerged = "",
    unstaged = "",
    untracked = "",
  },
  folder = {
    default = "",
    arrow_open = "",
    arrow_closed = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  },
}

local config = {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_buffer_on_setup = true,
  ignore_ft_on_setup = { "dashboard", "alpha" },
  auto_reload_on_write = true,
  open_on_tab = true,
  hijack_cursor = false,
  update_cwd = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

nvimtree.setup(config)

-- vim:ft=lua
