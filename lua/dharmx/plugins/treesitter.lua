local function req(file) require("dharmx.configs.treesitter." .. file) end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() req("init") end,
    build = ":TSUpdate",
    event = { "BufWinEnter" },
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function() req("context") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "andymass/vim-matchup",
    config = function() req("matchup") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    config = function() req("rainbow") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    config = function() req("textsubjects") end,
    keys = { { mode = "v", "." }, { mode = "v", ";" } },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function() req("textobjects") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function() req("dapvirtual") end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "LspAttach",
  },
  {
    "nvim-treesitter/playground",
    config = function() req("playground") end,
    cmd = "TSPlaygroundToggle",
  },
}
