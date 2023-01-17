local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then return end
local MainConfig = require("dharmx")

nvimtree.setup({
  auto_reload_on_write = true,
  update_cwd = true,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = true,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = true,
  ignore_buf_on_tab_change = {},
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = true,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {},
    },
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = MainConfig.ui.border,
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "all",
    root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }),
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = MainConfig.ui.tree.line,
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      symlink_arrow = MainConfig.ui.tree.symlink,
      padding = " ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = MainConfig.ui.tree.glyphs,
    },
    special_files = {
      ["Cargo.toml"] = 1,
      ["readme.md"] = 1,
      ["README.md"] = 1,
      ["Makefile"] = 1,
      ["MAKEFILE"] = 1,
    },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = MainConfig.black.filetype,
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = MainConfig.ui.tree.diagnostic,
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = MainConfig.ui.border,
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = MainConfig.black.filetype,
          buftype = MainConfig.black.buftype,
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  notify = {
    threshold = vim.log.levels.WARN,
  },
})

-- vim:filetype=lua
