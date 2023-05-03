local ok, neoscroll = pcall(require, "neoscroll")
if not ok then return end

neoscroll.setup({
  mappings = {
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true,
  stop_eof = true,
  use_local_scrolloff = false,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  easing_function = "quadratic",
  performance_mode = false,
  pre_hook = function(info)
    if info == "cursorline" then vim.wo.cursorline = false end
  end,
  post_hook = function(info)
    if info == "cursorline" then vim.wo.cursorline = true end
  end,
})
