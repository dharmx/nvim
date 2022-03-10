return {
  on_enter = function(filepath)
    local basename = vim.split(filepath, "/")
    if string.find(filepath, ".png$") then
      local command = "xclip -selection clipboard -target image/png '" .. filepath .. "'"
      system("bash -c '" .. command .. "'")
    else
      local command = "convert '" .. filepath .. "' png:- | xclip -selection clipboard -t image/png"
      system("bash -c '" .. command .. "'")
    end
    notify {
      message = "Copied " .. basename[#basename] .. " to the  clipboard.",
      icon = "",
      title = "telescope-media-files.nvim",
    }
  end,
  filetypes = { "png", "mp4", "webp", "jpg", "jpeg", "pdf" },
  find_cmd = "rg",
  offsets = { x = -1, y = -2 },
  sizes = { width = -1, height = 0 },
}

-- vim:ft=lua
