local M = {}

M.mappings = {
  ["name"] = " LSP",
}

set_map("n", "/", "<CMD>SearchBoxIncSearch<CR>", { noremap = true })
set_map("x", "/", "<CMD>SearchBoxIncSearch visual_mode=true<CR>", { noremap = true })

config.hooks = {
  before_mount = function(input)
    api.nvim_set_keymap("n", "<CR>", "<cmd>FineCmdline<CR>", { noremap = true })
    api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
  end,
  after_mount = function(input) end,
  set_keymaps = function(imap, feedkeys)
    local cfn = require("fine-cmdline").fn
    imap("<M-k>", cfn.up_search_history)
    imap("<M-j>", cfn.down_search_history)
    imap("<Up>", cfn.up_history)
    imap("<Down>", cfn.down_history)
    imap("<Esc>", cfn.close)
    imap("<C-c>", cfn.close)
    imap("<M-s>", function()
      if fn.pumvisible() == 0 then
        feedkeys "%s///gc<Left><Left><Left><Left>"
      end
    end)
  end,
}
M.options = {
  mode = "n",
  silent = true,
  noremap = true,
  prefix = "<leader>",
  nowait = true,
}

return M

-- vim:ft=lua
