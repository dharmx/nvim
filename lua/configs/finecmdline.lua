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

fine_cmdline.setup(config)

-- vim:ft=lua
