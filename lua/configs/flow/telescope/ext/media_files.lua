return {
  on_enter = function(filepath)
    if string.find(filepath, ".png$") then
      local command = "xclip -selection clipboard -target image/png '" .. filepath .. "'"
      vim.fn.system("bash -c '" .. command .. "'")
      return
    end

    local command = "convert '" .. filepath .. "' png:- | xclip -selection clipboard -t image/png"
    vim.fn.system("bash -c '" .. command .. "'")
  end,
  filetypes = { "png", "mp4", "webp", "jpg", "jpeg", "pdf" },
  find_cmd = "rg",
  offsets = { x = -1, y = -2 },
  sizes = { width = -1, height = 0 },
}
