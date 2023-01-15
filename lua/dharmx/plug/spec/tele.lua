local function req(file) require("dharmx.plug.config.tele." .. file) end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function() req("init") end,
    keys = { "<leader>" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension("ui-select") end,
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "dharmx/telescope-media.nvim",
    config = function() require("telescope").load_extension("media") end,
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "debugloop/telescope-undo.nvim",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension("undo") end,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension("dap") end,
  },
}

-- vim:filetype=lua
