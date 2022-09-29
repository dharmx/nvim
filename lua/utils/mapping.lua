--- Utilities for setting up various types of mappings.

local M = {}

--- Wraps which-key.register function, it doesn't abstract any params.
--- You can set it to any modes. Default mode is normal.
-- @param description description of the mapping that will be displayed on
-- the which-key popup.
-- @param trigger the keymap that will trigger the neovim command
-- @param target the command that will be executed upon that keypress
-- @param options other options like mode, silent, noremap, etc should be passed with this
-- @tparam options.mode vim mode in which the key will be mapped in
-- @tparam options.noremap see help noremap
-- @tparam options.nowait see help nowait
-- @tparam options.silent see help silent
-- @tparam options.prefix the given key needs to be pressed in order to get to the actual
-- mapping
-- @tparam options.buffer the buffer that this set of keymaps will be valid in.
function M.map(description, trigger, target, options)
  if not options then
    options = {}
  end
  -- default @{which-key.register} opts configuration
  local defaults = {
    mode = "n",
    silent = true,
    noremap = true,
    prefix = nil,
    buffer = nil,
    nowait = false,
  }
  local mapping = {
    [trigger] = {
      "<CMD>" .. target .. "<CR>",
      description,
    },
  }
  -- remove defaults and override with the option value
  require("which-key").register(mapping, vim.tbl_extend("force", defaults, options))
end

--- Registers a which-key map for visual mode.
-- @param refer to @{M.map}
function M.xmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "x"
  M.map(description, trigger, target, options)
end

--- Registers a which-key map for normal mode.
-- @param refer to @{M.map}
function M.nmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "n"
  M.map(description, trigger, target, options)
end

--- Registers a which-key map for terminal mode.
-- @param refer to @{M.map}
function M.tmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "t"
  M.map(description, trigger, target, options)
end

--- Registers a which-key map for insert mode.
-- @param refer to @{M.map}
-- @see help modes
function M.imap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "i"
  M.map(description, trigger, target, options)
end

--- Registers a which-key map for visual-select mode.
-- @param refer to @{M.map}
-- @see help modes
function M.vmap(description, trigger, target, options)
  if not options then
    options = {}
  end
  options.mode = "v"
  M.map(description, trigger, target, options)
end

--- Adds keybindings for searchbox prompt.
-- @see plugin https://is.gd/SBY1TY
-- @see help modes
function M.search_override()
  vim.keymap.set("n", "/", "<CMD>SearchBoxIncSearch<CR>", { noremap = true })
  vim.keymap.set("x", "/", "<CMD>SearchBoxIncSearch visual_mode=true<CR>", { noremap = true })
end

-- Adds keybindings for fine-cmdline prompt.
-- @see plugin https://is.gd/m0cmNB
function M.cmdline_override(temp)
  local cfn = require("fine-cmdline").fn
  vim.keymap.set("n", ":", "<CMD>FineCmdline<CR>", {
    noremap = true,
    buffer = 0,
  })

  -- NOTE: Apparently, using this globally causes problems. So we set it to the current buffer.
  -- NOTE: Might define an auto-command later.
  if temp then
    vim.keymap.set("i", "<M-s>", function()
      if vim.fn.pumvisible() == 0 then
        cfn.nvim_feedkeys("%s///gc<Left><Left><Left><Left>")
      end
    end, { buffer = 0 })
    vim.keymap.set("n", "<CR>", "<CMD>FineCmdline<CR>", {
      noremap = true,
      buffer = 0,
    })
    vim.keymap.set("i", "<M-k>", cfn.up_search_history, { buffer = 0 })
    vim.keymap.set("i", "<M-j>", cfn.down_search_history, { buffer = 0 })
    vim.keymap.set("i", "<Up>", cfn.up_history, { buffer = 0 })
    vim.keymap.set("i", "<Down>", cfn.down_history, { buffer = 0 })
    vim.keymap.set("i", "<Esc>", cfn.close, { buffer = 0 })
  end
end

return M

-- vim:ft=lua
