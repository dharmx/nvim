return {
  {
    "folke/lazy.nvim",
  },
  {
    "dharmx/colo.nvim",
    dependencies = { "b0o/incline.nvim" },
    opts = {
      theme = "radium_dark",
      reload = {
        enable = true,
        items = {
          "colo.groups",
          { "colo.extensions.feline", import = true },
          { "dharmx.configs.interface.incline", import = true },
          { "dharmx.configs.interface.bufferline", import = true },
          { "dharmx.configs.interface.feline", import = true },
        },
      },
    },
    branch = "dev",
    dev = true,
    lazy = false,
  },
}
