local function req(file) require("dharmx.configs.treesitter." .. file) end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() req("init") end,
    build = ":TSUpdate",
    event = "BufWinEnter",
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
    "HiPhish/nvim-ts-rainbow2",
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
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
    event = "BufWinEnter",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup()
    end,
    event = "BufWinEnter",
  },
}
