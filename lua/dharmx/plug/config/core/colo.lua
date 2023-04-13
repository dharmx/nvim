local ok, colo = pcall(require, "colo")
if not ok then return end

colo.setup({
  theme = "radium_dark",
  reload = {
    enable = true,
    items = {
      "colo.groups",
      { "colo.extensions.feline", import = true },
      { "dharmx.plug.config.ui.feline", import = true },
      -- { "dharmx.plug.config.ui.bufferline", import = true },
      -- { "dharmx.plug.config.ui.alpha", import = true },
    },
  },
})

vim.cmd.ColoToggle("bold", "underline")
