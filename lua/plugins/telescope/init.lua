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
    config = true,
    cmd = {
      "Track",
      "TrackPick",
      "TrackMark",
      "TrackBundleAlternate",
      "TrackUnmark",
      "TrackStashBundle",
      "TrackRestoreBundle",
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
