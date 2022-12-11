local function req(file) require("dharmx.plug.config.tree." .. file) end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() req("init") end,
    build = ":TSUpdate",
    event = { "BufRead", "BufWinEnter", "BufEnter" },
  },
  {
    "andymass/vim-matchup",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {
    "p00f/nvim-ts-rainbow",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() req("autotag") end,
    lazy = true,
  },
  {
    "romgrk/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() req("context") end,
    lazy = true,
  },
  {
    "lewis6991/spellsitter.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() req("spellsitter") end,
  },
}

-- vim:filetype=lua
