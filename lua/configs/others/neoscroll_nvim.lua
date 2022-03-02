local present, neoscroll = pcall(require, "neoscroll")

if not present then
  return
end

local config = {
  mappings = require("mappings.unknown").neoscroll_nvim,
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing_function = "quadratic", -- Default easing function

  performance_mode = false, -- Disable "Performance Mode" on all buffers.
  pre_hook = function(info)
    if info == "cursorline" then
      vim.wo.cursorline = false
    end
  end,
  post_hook = function(info)
    if info == "cursorline" then
      vim.wo.cursorline = true
    end
  end,
}

neoscroll.setup(config)
