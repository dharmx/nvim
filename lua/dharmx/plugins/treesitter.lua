local function req(file) require("dharmx.configs.treesitter." .. file) end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() req("init") end,
    build = ":TSUpdate",
    event = "BufWinEnter",
  },
  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup({
        playground = {
          enable = true,
          updatetime = 25,
          persist_queries = true,
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end
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
