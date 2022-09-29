local present, lightbulb = pcall(require, "nvim-lightbulb")

if not present then
  return
end

-- require'nvim-lightbulb'.get_status_text()
local config = {
  -- LSP client names to ignore
  -- Example: {"sumneko_lua", }
  -- ignore = { "null-ls" },
  sign = {
    enabled = true,
    priority = 10,
  },
  float = {
    -- Available keys for window options:
    -- - height     of floating window
    -- - width      of floating window
    -- - wrap_at    character to wrap at for computing height
    -- - max_width  maximal width of floating window
    -- - max_height maximal height of floating window
    -- - pad_left   number of columns to pad contents at left
    -- - pad_right  number of columns to pad contents at right
    -- - pad_top    number of lines to pad contents at top
    -- - pad_bottom number of lines to pad contents at bottom
    -- - offset_x   x-axis offset of the floating window
    -- - offset_y   y-axis offset of the floating window
    -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
    -- - winblend   transparency of the window (0-100)
    enabled = false,
    text = "ﯦ Code actions available",
    win_opts = {
      border = "solid",
    },
  },
  virtual_text = {
    enabled = true,
    -- Text to show at virtual text
    text = " ﮠ",
    -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
    hl_mode = "replace",
  },
  status_text = {
    enabled = true,
    -- Text to provide when code actions are available
    text = "Actions",
    -- Text to provide when no actions are available
    text_unavailable = "None",
  },
}

local lsp_utils = require("utils.lsp")
lsp_utils.lsp_signdef("LightBulbSign", " ", "LightBulbSign")

lightbulb.setup(config)

-- vim:ft=lua
