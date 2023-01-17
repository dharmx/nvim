local ok, comments = pcall(require, "Comment")
if not ok then return end

local config = {
  padding = true,
  sticky = true,
  ignore = "^$",
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  mappings = {
    basic = true,
    extra = true,
  },
  pre_hook = function(ctx)
    if vim.bo.filetype == "typescriptreact" then
      local util = require("Comment.utils")
      local type = ctx.ctype == util.ctype.linewise and "__default" or "__multiline"
      local location = nil
      if ctx.ctype == util.ctype.blockwise then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == util.cmotion.v or ctx.cmotion == util.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end
      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
  post_hook = nil,
}

comments.setup(config)

-- vim:filetype=lua
