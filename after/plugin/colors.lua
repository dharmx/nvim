function say_hello()
  vim.fn.system({ "dunstify", "hello" })
end
