local present, devicons = pcall(require, "nvim-web-devicons")

if not present then
  return
end

local colors = require("utils.theming").get_active_theme()

local config = {
  override = {
    c = { icon = "", color = colors.rainbow.cobalt, name = "C" },
    css = { icon = "", color = colors.rainbow.cobalt, name = "CSS" },
    deb = { icon = "", color = colors.rainbow.cyan, name = "Deb" },
    Dockerfile = {
      icon = "",
      color = colors.rainbow.cyan,
      name = "Dockerfile",
    },
    html = { icon = "", color = colors.rainbow.pink, name = "HTML" },
    jpeg = { icon = "", color = colors.rainbow.purple, name = "JPEG" },
    jpg = { icon = "", color = colors.rainbow.purple, name = "JPG" },
    js = { icon = "", color = colors.common.base13, name = "JS" },
    kt = { icon = "", color = colors.rainbow.orange, name = "Kt" },
    lock = { icon = "", color = colors.common.base11, name = "Lock" },
    lua = { icon = "", color = colors.rainbow.cobalt, name = "Lua" },
    mp3 = { icon = "", color = colors.rainbow.yellow, name = "MP3" },
    mp4 = { icon = "", color = colors.rainbow.yellow, name = "MP4" },
    out = { icon = "", color = colors.common.base03, name = "Out" },
    png = { icon = "", color = colors.rainbow.purple, name = "PNG" },
    py = { icon = "", color = colors.rainbow.yellow, name = "Py" },
    ["robots.txt"] = {
      icon = "ﮧ",
      color = colors.common.base11,
      name = "robots",
    },
    toml = { icon = "", color = colors.rainbow.cobalt, name = "TOML" },
    ts = { icon = "ﯤ", color = colors.rainbow.cobalt, name = "TS" },
    ttf = {
      icon = "",
      color = colors.common.base04,
      name = "TrueTypeFont",
    },
    rb = { icon = "", color = colors.rainbow.pink, name = "Rb" },
    yuck = { icon = "", color = colors.rainbow.orange, name = "Yuck" },
    vim = { icon = "", color = colors.rainbow.green, name = "Vim" },
    rpm = { icon = "", color = colors.rainbow.orange, name = "RPM" },
    vue = { icon = "﵂", color = colors.rainbow.green, name = "Vue" },
    woff = {
      icon = "",
      color = colors.common.base15,
      name = "WebOpenFontFormat",
    },
    woff2 = {
      icon = "",
      color = colors.common.base15,
      name = "WebOpenFontFormat2",
    },
    xz = { icon = "", color = colors.common.base13, name = "XZ" },
    zip = { icon = "", color = colors.common.base13, name = "Zip" },
  },
  default = true,
}

devicons.set_default_icon("", colors.shades.shade01)
devicons.setup(config)

-- vim:ft=lua
