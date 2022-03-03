local M = {}

M.after = function()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    filters = {
      dotfiles = false,
      custom = {},
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 35,
      hide_root_folder = false,
      side = "left",
      auto_resize = true,
      mappings = { custom_only = false, list = {} },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      italic_comments = false,
      transparency = true,
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    actions = {
      change_dir = {
        enable = true,
        global = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
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
end

M.before = function()
  local g = vim.g

  g.nvim_tree_create_in_closed_folder = 1
  g.nvim_tree_add_trailing = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_group_empty = 1
  g.nvim_tree_symlink_arrow = " 壟 "

  g.nvim_tree_group_empty = 1
  g.nvim_tree_icon_padding = " "
  g.nvim_tree_respect_buf_cwd = 1
  g.nvim_tree_root_folder_modifier = table.concat {
    ":t:gs?$?/..",
    string.rep(" ", 1000),
    "?:gs?^??",
  }

  g.nvim_tree_special_files = {
    ["README.md"] = 1,
    ["Makefile"] = 1,
    ["MAKEFILE"] = 1,
  }

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
      ignore = false,
    },
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  }
end

return M
