local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

local config = {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "▌", -- █
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "▌",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = " ",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = " ",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  signcolumn = false,
  numhl = false,
  linehl = false,
  word_diff = false,
  keymaps = {
    noremap = true,

    ["n]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
    ["n[c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

    ["n<leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
    ["v<leader>hs"] = ":Gitsigns stage_hunk<CR>",
    ["n<leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
    ["n<leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
    ["v<leader>hr"] = ":Gitsigns reset_hunk<CR>",
    ["n<leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",
    ["n<leader>hp"] = "<cmd>Gitsigns preview_hunk<CR>",
    ["n<leader>hb"] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    ["n<leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
    ["n<leader>hU"] = "<cmd>Gitsigns reset_buffer_index<CR>",

    -- Text objects
    ["oih"] = ":<C-U>Gitsigns select_hunk<CR>",
    ["xih"] = ":<C-U>Gitsigns select_hunk<CR>",
  },
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
  yadm = { enable = true },
}

gitsigns.setup(config)

-- vim:ft=lua
