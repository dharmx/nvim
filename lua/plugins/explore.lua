return {
  {
    "TheBallsUp/lube.nvim",
    dev = true,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 0.2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = { border = "solid", winblend = 0 },
      highlights = {
        Normal = { link = "NormalFloat" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
      },
    },
    cmd = "ToggleTerm",
  },
  {
    "kevinhwang91/rnvimr",
    init = function()
      local g = vim.g
      local fn = vim.fn
      local api = vim.api

      g.rnvimr_enable_ex = 1
      g.rnvimr_enable_picker = 1
      g.rnvimr_edit_cmd = "drop"
      g.rnvimr_draw_border = 0
      g.rnvimr_hide_gitignore = 1
      g.rnvimr_border_attr = { ["fg"] = 14, ["bg"] = -1 }
      g.rnvimr_enable_bw = 1
      g.rnvimr_shadow_winblend = 70

      g.rnvimr_action = {
        ["<C-t>"] = "NvimEdit tabedit",
        ["<C-x>"] = "NvimEdit split",
        ["<C-v>"] = "NvimEdit vsplit",
        ["gw"] = "JumpNvimCwd",
        ["yw"] = "EmitRangerCwd",
      }

      g.rnvimr_presets = {
        { ["width"] = 0.800, ["height"] = 0.800 },
        { ["width"] = 0.600, ["height"] = 0.600 },
        { ["width"] = 0.950, ["height"] = 0.950 },
        { ["width"] = 0.500, ["height"] = 0.500, ["col"] = 0, ["row"] = 0 },
        { ["width"] = 0.500, ["height"] = 0.500, ["col"] = 0, ["row"] = 0.5 },
        { ["width"] = 0.500, ["height"] = 0.500, ["col"] = 0.5, ["row"] = 0 },
        { ["width"] = 0.500, ["height"] = 0.500, ["col"] = 0.5, ["row"] = 0.5 },
        { ["width"] = 0.500, ["height"] = 1.000, ["col"] = 0, ["row"] = 0 },
        { ["width"] = 0.500, ["height"] = 1.000, ["col"] = 0.5, ["row"] = 0 },
        { ["width"] = 1.000, ["height"] = 0.500, ["col"] = 0, ["row"] = 0 },
        { ["width"] = 1.000, ["height"] = 0.500, ["col"] = 0, ["row"] = 0.5 },
      }

      g.rnvimr_ranger_views = {
        {
          ["minwidth"] = 90,
          ["ratio"] = {},
        },
        {
          ["minwidth"] = 50,
          ["maxwidth"] = 89,
          ["ratio"] = { 1, 1 },
        },
        {
          ["maxwidth"] = 49,
          ["ratio"] = { 1 },
        },
      }

      g.rnvimr_layout = {
        ["relative"] = "editor",
        ["width"] = fn.float2nr(fn.round(0.7 * api.nvim_win_get_width(0))),
        ["height"] = fn.float2nr(fn.round(0.7 * api.nvim_win_get_height(0))),
        ["col"] = fn.float2nr(fn.round(0.15 * api.nvim_win_get_width(0))),
        ["row"] = fn.float2nr(fn.round(0.15 * api.nvim_win_get_height(0))),
        ["style"] = "minimal",
      }

      g.rnvimr_layout = {
        ["relative"] = "editor",
        ["width"] = api.nvim_win_get_width(0),
        ["height"] = api.nvim_win_get_height(0) - 2,
        ["col"] = 0,
        ["row"] = 0,
        ["style"] = "minimal",
      }
    end,
    lazy = false,
  },
}
