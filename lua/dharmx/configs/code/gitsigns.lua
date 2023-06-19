local present, gitsigns = pcall(require, "gitsigns")
if not present then return end

gitsigns.setup({
  signs = {
    add = {
      texthl = "GitSignsAdd",
      text = "▌",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      texthl = "GitSignsChange",
      text = "▌",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      texthl = "GitSignsDelete",
      text = " ",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      texthl = "GitSignsDelete",
      text = " ",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      texthl = "GitSignsChange",
      text = "▌",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
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
  current_line_blame_formatter_opts = { relative_time = true },
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
  yadm = { enable = false },
})
