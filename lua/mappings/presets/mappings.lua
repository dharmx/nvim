local M = {}

M.mappings = {
  ["name"] = " Keymap documentation",
  ["k"] = { "<CMD>lua require('legendary').find('keymaps')<CR>", " Find keymaps" },
  ["c"] = { "<CMD>lua require('legendary').find('commands')<CR>", " Find commands" },
  ["a"] = { "<CMD>lua require('legendary').find('autocmds')<CR>", " Find auto-commands" },
  ["A"] = { "<CMD>lua require('legendary').find()<CR>", " Find keymaps/commands/autocmds" },
}

M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader><leader>",
  nowait = true,
}

return M

-- vim:ft=lua
