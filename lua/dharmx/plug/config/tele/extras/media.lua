local canned = require("telescope._extensions.media.canned")

return {
  backend = "ueberzug",
  on_confirm = canned.single.set_wallpaper,
}
