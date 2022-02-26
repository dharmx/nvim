local g = vim.g

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_symlink_arrow = " 壟 "

g.nvim_tree_window_picker_exclude = {
  filetype = { "notify", "packer", "qf" },
  buftype = { "terminal" },
}

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
