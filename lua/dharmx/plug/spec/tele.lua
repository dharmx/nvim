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
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function() require("telescope").load_extension("vim_bookmarks") end,
    cmd = "BookmarkToggle",
    keys = { "<F9>" },
  },
}

-- vim:filetype=lua
