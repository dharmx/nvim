local present, fine_cmdline = pcall(require, "fine-cmdline")

if not present then
  return
end

local config = {
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = "   ",
  },
  popup = {
    position = {
      row = "20%",
      col = "50%",
    },
    size = {
      width = "70%",
    },
    border = {
      style = "single",
      padding = {
        top = 0,
        bottom = 0,
        left = 0,
        right = 0,
      },
      text = {
        bottom_align = "center",
        bottom = "▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃▃",
      },
    },
    win_options = {
      winhighlight = "TabLine:Boolean,FloatBorder:FloatBorder",
    },
    buf_options = {
      filetype = "FineCmdlinePrompt",
    },
  },
}

config.hooks = {
  before_mount = function(input)
    vim.api.nvim_set_keymap("n", "<CR>", "<cmd>FineCmdline<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
  end,
  after_mount = function(input) end,
  set_keymaps = function(imap, feedkeys)
    local fn = require("fine-cmdline").fn
    imap("<M-k>", fn.up_search_history)
    imap("<M-j>", fn.down_search_history)
    imap("<Up>", fn.up_history)
    imap("<Down>", fn.down_history)
    imap("<Esc>", fn.close)
    imap("<C-c>", fn.close)
    imap("<M-s>", function()
      if vim.fn.pumvisible() == 0 then
        feedkeys "%s///gc<Left><Left><Left><Left>"
      end
    end)
  end,
}

fine_cmdline.setup(config)
