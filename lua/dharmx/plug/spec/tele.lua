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
    event = { "CursorHold", "CursorMoved", "InsertEnter", "CmdlineEnter" },
  },
  {
    "dharmx/telescope-media.nvim",
    config = function() require("telescope").load_extension("media") end,
    dependencies = "nvim-telescope/telescope.nvim",
    keys = { "<leader>i" },
    dev = true,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    event = "CmdlineEnter",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
    config = function() require("telescope").load_extension("dap") end,
    event = "LspAttach",
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "MattesGroeger/vim-bookmarks" },
    config = function() require("telescope").load_extension("vim_bookmarks") end,
    cmd = "BookmarkToggle",
  },
}

-- vim:filetype=lua
