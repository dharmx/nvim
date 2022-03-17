local M = {}

function M.map(description, trigger, target, options)
  if not options then
    options = {}
  end
  local defaults = {
    mode = "n",
    silent = true,
    noremap = true,
    prefix = nil,
    buffer = nil,
    nowait = false,
  }
  local mapping = { [trigger] = { "<CMD>" .. target .. "<CR>", description } }
  require("which-key").register(mapping, vim.tbl_extend("force", defaults, options))
end

function M.xmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "x"
  M.map(description, trigger, target, options)
end

function M.nmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "n"
  M.map(description, trigger, target, options)
end

function M.imap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "i"
  M.map(description, trigger, target, options)
end

function M.vmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "v"
  M.map(description, trigger, target, options)
end

function M.search_override()
  set_map("n", "/", "<CMD>SearchBoxIncSearch<CR>", { noremap = true })
  set_map("x", "/", "<CMD>SearchBoxIncSearch visual_mode=true<CR>", { noremap = true })
end

function M.cmdline_override()
  local cfn = require("fine-cmdline").fn
  set_map("n", "<CR>", "<CMD>FineCmdline<CR>", { noremap = true })
  set_map("n", ":", "<CMD>FineCmdline<CR>", { noremap = true })
  set_map("i", "<M-s>", function()
    if fn.pumvisible() == 0 then
      cfn.nvim_feedkeys "%s///gc<Left><Left><Left><Left>"
    end
  end)
  set_map("i", "<M-k>", cfn.up_search_history)
  set_map("i", "<M-j>", cfn.down_search_history)
  set_map("i", "<Up>", cfn.up_history)
  set_map("i", "<Down>", cfn.down_history)
  set_map("i", "<Esc>", cfn.close)
end

return M

-- vim:ft=lua
