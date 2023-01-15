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
    event = "InsertEnter",
  },
  {
    "p00f/nvim-ts-rainbow",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { { mode = "i", "{", "}" } },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = {
      "TSTextobjectSelect",
      "TSTextobjectSwapNext",
      "TSTextobjectGotoNextEnd",
      "TSTextobjectSwapPrevious",
      "TSTextobjectGotoNextStart",
      "TSTextobjectGotoPreviousEnd",
      "TSTextobjectGotoPreviousStart",
      "TSTextobjectPeekDefinitionCode",
    },
    keys = { "]", "[" },
  },
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
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
    event = "InsertEnter",
  },
}

-- vim:filetype=lua
