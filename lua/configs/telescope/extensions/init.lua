local extensions = {}

for _, extension in ipairs {
  "command_palette",
  "bookmarks",
  "frecency",
  "media_files",
  "packer",
  "tele_tabby",
  "project",
  "file_browser",
  "fzf",
  "arecibo",
  "ui-select",
  "history",
} do
  extensions[extension] = require("configs.telescope.extensions." .. extension)
end

return extensions

-- vim:ft=lua
