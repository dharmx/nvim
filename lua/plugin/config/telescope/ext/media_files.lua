return {
  on_enter = require("utils.plugins").copy_image,
  filetypes = { "png", "mp4", "webp", "jpg", "jpeg", "pdf" },
  find_cmd = "rg",
  offsets = { x = -1, y = -2 },
  sizes = { width = -1, height = 0 },
}

-- vim:ft=lua
