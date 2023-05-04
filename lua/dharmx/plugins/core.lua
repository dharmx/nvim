local function req(file) require("dharmx.configs.core." .. file) end

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
          { "dharmx.configs.interface.feline", import = true },
        },
      },
    },
    branch = "dev",
    dev = true,
    lazy = false,
  },
}
