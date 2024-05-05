return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-telescope/telescope-symbols.nvim",
    config = function()
      require("plugins.telescope.config")
    end,
    cmd = "Telescope",
  },
  {
    "dharmx/track.nvim",
    opts = {
      pad = {
        config = { title_pos = "center" },
        serial_map = true,
        disable_devicons = false,
        disable_status = false,
      },
      pickers = {
        bundles = {
          disable_devicons = false,
          serial_map = true,
        },
        views = {
          disable_devicons = false,
          serial_map = true,
        },
      },
    },
    cmd = {
      "Track",
      "Mark",
      "Unmark",
      "MarkOpened",
    },
    dev = true,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },
  { "dharmx/telescope-media.nvim", dev = true },
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-dap.nvim",
}
