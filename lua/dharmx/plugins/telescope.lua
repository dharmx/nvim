return {
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("dharmx.configs.telescope") end,
    dependencies = { "nvim-telescope/telescope-symbols.nvim" },
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
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "dharmx/telescope-media.nvim",
    dev = true,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
}
