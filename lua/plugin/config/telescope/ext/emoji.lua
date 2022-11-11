return {
  action = function(emoji)
    vim.fn.setreg("*", emoji.value)
    print([[Press p or "*p to paste this emoji]] .. emoji.value)
  end,
}

-- vim:ft=lua
