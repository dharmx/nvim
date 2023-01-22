local function req(file) require("dharmx.plug.config.tree." .. file) end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() req("init") end,
    build = ":TSUpdate",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function() req("context") end,
    lazy = false,
  },
  {
    "andymass/vim-matchup",
    config = function() req("matchup") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    config = function() req("docs") end,
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
    "ckolkey/ts-node-action",
    config = function() req("nodeaction") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function() req("textobjects") end,
    event = { "CursorHold", "CursorMoved", "InsertEnter" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function() req("dapvirtual") end,
    event = "LspAttach",
  },
  {
    "nvim-treesitter/playground",
    config = function() req("playground") end,
    cmd = "TSPlaygroundToggle",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function() req("autotag") end,
    ft = { "html", "markdown" },
  },
}

-- vim:filetype=lua
