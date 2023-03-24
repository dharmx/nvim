local function req(file) require("dharmx.plug.config.tele." .. file) end

return {
  {
    "nvim-telescope/telescope.nvim",
    config = function() req("init") end,
    cmd = "Telescope",
  },
  {
    "dharmx/track.nvim",
    config = function() req("track") end,
    cmd = { "Track", "MarkFile", "UnmarkFile", "MarkPosition", "UnmarkPosition" },
    -- dev = true,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "dharmx/telescope-media.nvim",
    -- dev = true,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
}
