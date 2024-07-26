return {
  {
    "NeogitOrg/neogit",
    opts = {
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
    },
    cmd = "Neogit",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signcolumn = false,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { interval = 1000, follow_files = true },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "overlay",
        delay = 1000,
        ignore_whitespace = true,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "solid",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
    event = { "CmdlineEnter", "InsertEnter", "CursorHold", "CursorMoved" },
  },
}
