local M = {}

M.nvim_autopairs = "qwertyuiopzxcvbnmasdfghjkl"

M.nvim_cmp = function(cmp)
  local fn = vim.fn
  local api = vim.api

  return {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-i>"] = cmp.mapping.select_prev_item(),
    ["<C-p>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end,
  }
end

M.lsp_config = function(client, bufnr)
  local util = require "utils.nvim"
  util.buf_opt("omnifunc", "v:lua.vim.lsp.omnifunc")
  function map(key, cmd)
    util.map("n", key, cmd, { noremap = true, silent = true })
  end

  map("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  map("<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  map("<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  map("<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map("<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  map("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("<space>E", "<cmd>lua vim.diagnostic.open_float()<CR>")
  map("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  map("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  map("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  map("<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

M.lsp_saga = {
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = { quit = "q", exec = "<CR>" },
  rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
}

M.ts_playground = {
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
}

M.ts_refactor = {
  navigation = {
    goto_definition = "gnd",
    list_definitions = "gnD",
    list_definitions_toc = "gO",
    goto_next_usage = "<a-*>",
    goto_previous_usage = "<a-#>",
  },
  smart_rename = { smart_rename = "grr" },
}

M.ts_textobjects = {
  select = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  },
  swap = {
    swap_next = { ["<leader>a"] = "@parameter.inner" },
    swap_previous = { ["<leader>A"] = "@parameter.inner" },
  },
  move = {
    goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
    goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
  lsp_interop = {
    peek_definition_code = {
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}

M.symbols_outline = { -- These keymaps can be a string or a table for multiple keys
  close = { "<Esc>", "q" },
  goto_location = "<Cr>",
  focus_location = "o",
  hover_symbol = "<C-space>",
  toggle_preview = "K",
  rename_symbol = "r",
  code_actions = "a",
}

M.better_escape = { "jk", "jj" }

M.gitsigns_nvim = {
  noremap = true,

  ["n]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
  ["n[c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

  ["n<leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
  ["v<leader>hs"] = ":Gitsigns stage_hunk<CR>",
  ["n<leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
  ["n<leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
  ["v<leader>hr"] = ":Gitsigns reset_hunk<CR>",
  ["n<leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",
  ["n<leader>hp"] = "<cmd>Gitsigns preview_hunk<CR>",
  ["n<leader>hb"] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
  ["n<leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
  ["n<leader>hU"] = "<cmd>Gitsigns reset_buffer_index<CR>",

  -- Text objects
  ["oih"] = ":<C-U>Gitsigns select_hunk<CR>",
  ["xih"] = ":<C-U>Gitsigns select_hunk<CR>",
}

M.neoscroll_nvim = {
  "<C-u>",
  "<C-d>",
  "<C-b>",
  "<C-f>",
  "<C-y>",
  "<C-e>",
  "zt",
  "zz",
  "zb",
}

M.neoclip = {
  telescope = {
    i = {
      select = "<cr>",
      paste = "<c-p>",
      paste_behind = "<c-k>",
      replay = "<c-q>",
      custom = {},
    },
    n = {
      select = "<cr>",
      paste = "p",
      paste_behind = "P",
      replay = "q",
      custom = {},
    },
  },
  fzf = {
    select = "default",
    paste = "ctrl-p",
    paste_behind = "ctrl-k",
    custom = {},
  },
}

M.packer_nvim = { quit = "q", toggle_info = "<CR>", diff = "d", prompt_revert = "r" }

M.toggleterm_nvim = { open_mapping = "<c-\\>" }

M.trouble_nvim = { -- key mappings for actions in the trouble list
  -- map to {} to remove a mapping, for example:
  -- close = {},
  close = "q", -- close the list
  cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
  refresh = "r", -- manually refresh
  jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
  open_split = { "<c-x>" }, -- open buffer in new split
  open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
  open_tab = { "<c-t>" }, -- open buffer in new tab
  jump_close = { "o" }, -- jump to the diagnostic and close the list
  toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
  toggle_preview = "P", -- toggle auto_preview
  hover = "K", -- opens a small popup with the full multiline message
  preview = "p", -- preview the diagnostic location
  close_folds = { "zM", "zm" }, -- close all folds
  open_folds = { "zR", "zr" }, -- open all folds
  toggle_fold = { "zA", "za" }, -- toggle fold of current file
  previous = "k", -- preview item
  next = "j", -- next item
}

M.which_key_nvim = { popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" } }

M.lsp_installer = {
  toggle_server_expand = "<CR>",
  install_server = "i",
  update_server = "u",
  update_all_servers = "U",
  uninstall_server = "X",
}

return M
