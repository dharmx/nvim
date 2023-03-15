local function req(file) require("dharmx.plug.config.tele." .. file) end

return {
  {
    "nvim-telescope/telescope.nvim",
    config = function() req("init") end,
    cmd = "Telescope",
    dependencies = { "nvim-telescope/telescope-symbols.nvim" },
    keys = { "<leader>" },
  },
  {
    "dharmx/telescope-track.nvim",
    config = function() require("telescope").load_extension("track") end,
    dev = true,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension("ui-select") end,
    event = "LspAttach",
  },
  {
    "dharmx/telescope-media.nvim",
    config = function() require("telescope").load_extension("media") end,
    keys = { "<leader>i" },
    dev = true,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function() require("telescope").load_extension("dap") end,
    event = "LspAttach",
  },
}
