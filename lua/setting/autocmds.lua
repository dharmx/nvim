--- Autocommand configuration list.
-- @module settings.autocmds

local nv = require("utils.neovim")
local util = require("utils")
local autocmd = nv.autocmd
local augroup = nv.augroup
local notify = nv.notify
local opt_local = vim.opt_local

autocmd("BufEnter", "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif", {
  nested = true,
  desc = "Auto-close NvimTree on opening a file",
})

-- IMPROVE: Filter out plugins/init.lua as recompiling on its change is redundant.
autocmd("BufWritePost", function()
  require("packer").compile()
end, {
  patterns = "*/lua/plugin/spec/*.lua",
  desc = "Automatically re-compile plugin specifications on changing the matched pattern files.",
})

autocmd("TextYankPost", function()
  vim.highlight.on_yank({
    higroup = "DiffText",
    on_macro = true,
    on_visual = true,
    timeout = 100,
  })
end, {
  desc = "Provide a visual color feedback on yanking.",
})

augroup("NotifyOnPackerOperation", {
  {
    events = "User",
    command = function()
      notify({
        message = "Operation complete!",
        title = "packer.nvim",
        icon = "",
      })
    end,
    options = {
      patterns = "PackerComplete",
      desc = "Show a notification when any packer operation is complete. For example a notification with the title 'Finised compiled!' will be shot when Compiling plugin specifications are finished!",
    },
  },
  {
    events = "User",
    command = function()
      notify({
        message = "Finished compiling!",
        title = "packer.nvim",
        icon = "",
      })
    end,
    options = {
      patterns = "PackerCompileDone",
      options = {
        desc = "Show a notification when any packer operation is complete!",
      },
    },
  },
})

autocmd("FileType", [[nnoremap <buffer><silent> q :quit<CR>]], {
  patterns = "man",
})

-- autocmd("UIEnter", function()
--   local Spinner = require("utils.spinner")
--   local spinners = {}

--   local function format_msg(msg, percentage)
--     msg = msg or ""
--     if not percentage then
--       return msg
--     end
--     return string.format("%2d%%\t%s", percentage, msg)
--   end

--   autocmd("User", function()
--     for _, c in ipairs(vim.lsp.get_active_clients()) do
--       for token, ctx in pairs(c.messages.progress) do
--         if not spinners[c.id] then
--           spinners[c.id] = {}
--         end
--         local s = spinners[c.id][token]
--         if not ctx.done then
--           if not s then
--             spinners[c.id][token] = Spinner(format_msg(ctx.message, ctx.percentage), vim.log.levels.INFO, {
--               title = ctx.title and string.format("%s: %s", c.name, ctx.title) or c.name,
--             })
--           else
--             s:update(format_msg(ctx.message, ctx.percentage))
--           end
--         else
--           c.messages.progress[token] = nil
--           if s then
--             s:done(ctx.message or "Complete", nil, {
--               icon = "",
--             })
--             spinners[c.id][token] = nil
--           end
--         end
--       end
--     end
--   end, {
--     pattern = { "LspProgressUpdate" },
--     group = vim.api.nvim_create_augroup("LSPNotify", { clear = true }),
--     desc = "LSP progress notifications",
--   })
-- end, {
--   once = true,
-- })

augroup("NativeAdjustments", {
  {
    events = {
      "TermOpen",
      "BufReadCmd",
    },
    command = function()
      opt_local.number = false
      opt_local.relativenumber = false
      require("utils.term")._TERM_KEYMAPS()
    end,
    options = {
      patterns = {
        "term://*",
        "zsh",
        "*/zsh",
        "sh",
        "bash",
        "toggleterm",
      },
      desc = "Add terminal keymaps.",
    },
  },
  {
    events = "FileType",
    command = function()
      opt_local.formatoptions:remove({
        "c",
        "r",
        "o",
      })
    end,
    options = {
      desc = "Removes comment continuations from every file.",
    },
  },
})

-- augroup("ReplaceModes", {
--   {
--     events = {
--       "BufEnter",
--       "FileType",
--     },
--     command = function()
--       require("utils.mapping").cmdline_override(true)
--     end,
--     options = {
--       desc = "Adds mappings specific to fine-cmdline.nvim",
--       patterns = "cmdline",
--     },
--   },
--   {
--     events = {
--       "BufEnter",
--       "FileType",
--     },
--     command = function()
--       require("utils.mapping").search_override()
--     end,
--     options = {
--       desc = "Adds mappings specific to searchbox.nvim",
--       patterns = "search",
--     },
--   },
-- })

augroup("PersistentMarkdownFolds", {
  {
    events = "BufWinLeave",
    command = "mkview",
    options = {
      patterns = "*.md",
      desc = "Adds persistent window folding to the makrdown files.",
    },
  },
  {
    events = "BufWinEnter",
    command = "silent! loadview",
    options = {
      patterns = "*.md",
      desc = "Load the view silently when a new window is opened!",
    },
  },
})

-- augroup("NvimINCSearchCursorline", {
--   {
--     events = "CmdlineEnter",
--     command = function()
--       opt_local.cursorline = true
--       opt_local.cursorcolumn = true
--       opt_local.hlsearch = true
--     end,
--     options = {
--       patterns = "/,\\?",
--       desc = "Add column-cursorline and cursorline values and search value",
--     },
--   },
--   {
--     events = "CmdlineLeave",
--     command = function()
--       opt_local.cursorline = false
--       opt_local.cursorcolumn = false
--       opt_local.hlsearch = false
--     end,
--     options = {
--       desc = "Remove column-cursorline and cursorline values and search value",
--       patterns = "/,\\?",
--     },
--   },
-- })

-- autocmd("BufReadPost", [[if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]], {
--   desc = "Start editing from the point we left off.",
-- })

augroup("ListCharsFeedback", {
  {
    events = "InsertEnter",
    command = function()
      opt_local.listchars = {
        tab = " ",
        trail = "˽",
        space = "·",
        eol = "↴",
      }
    end,
    options = { desc = "Show escape characters on Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.listchars = ""
    end,
    options = { desc = "Hide escape characters on leaving the Insert Mode." },
  },
})

-- NOTE: Enable this only if you want a scrollbar.
-- augroup("ScrollbarInit", {
--   {
--     events = {
--       "WinEnter",
--       "FocusGained",
--       "WinScrolled",
--       "VimResized",
--       "QuitPre",
--     },
--     command = function()
--       require("scrollbar").show()
--     end,
--     options = { desc = "Show scrollbar when foucsed and when scrolled." },
--   },
--   {
--     events = { "WinLeave", "BufLeave", "BufWinLeave", "FocusLost" },
--     command = function()
--       require("scrollbar").clear()
--     end,
--     options = {
--       desc = "Remove scrollbar when not foucsed or, leaving the current window/buffer.",
--     },
--   },
-- })

augroup("CursorLineFeedback", {
  {
    events = "InsertEnter",
    command = function()
      opt_local.cursorline = true
    end,
    options = { desc = "Show cursorline in Insert Mode." },
  },
  {
    events = "InsertLeave",
    command = function()
      opt_local.cursorline = false
    end,
    options = { desc = "Show cursorline in Insert Mode." },
  },
})

-- augroup("KittyPaddingOnNvim", {
--   {
--     events = "UIEnter",
--     command = function()
--       -- @see https://is.gd/QSh8RE
--       -- @see https://is.gd/XXso9o
--       -- @see https://is.gd/ZQ7EwS
--       local socket = vim.env.KITTY_LISTEN_ON
--       if socket then
--         io.popen(string.format("kitty @ --to %s set-spacing padding=0", socket)):close()
--       end
--     end,
--     options = {
--       desc = [[Adds padding to kitty when Nvim connects to the UI.
--       Using UIEnter and not VimEnter as we don't want this to happen
--       when we start an headless Nvim instance.]],
--     },
--   },
--   {
--     events = "UILeave",
--     command = function()
--       local socket = vim.env.KITTY_LISTEN_ON
--       if socket then
--         io.popen(string.format("kitty @ --to %s set-spacing padding=default", socket)):close()
--       end
--     end,
--     options = {
--       desc = "Removes padding from kitty when Nvim disconnects from the UI.",
--     },
--   },
-- })

-- augroup("StPaddingOnNvim", {
--   {
--     events = "UIEnter",
--     command = function()
--       -- @see https://is.gd/Za5OV1
--       local is_running_st = io.popen("pidof st")
--       if is_running_st then
--         local format = "xrdb -merge %s/Xresources/nvim.x && kill -USR1 %s"
--         local pids = is_running_st:read()
--         local xdg_config = os.getenv("XDG_CONFIG_HOME")

--         is_running_st:close()
--         io.popen(string.format(format, xdg_config, pids)):close()
--       end
--     end,
--     options = {
--       desc = [[Adds padding to st when Nvim connects to the UI.
--       Using UIEnter and not VimEnter as we don't want this to happen
--       when we start an headless Nvim instance.]],
--     },
--   },
--   {
--     events = "UILeave",
--     command = function()
--       local is_running_st = io.popen("pidof st")
--       if is_running_st then
--         local format = "xrdb -I%s/Xresources %s/Xresources/config.x && kill -USR1 %s"
--         local pids = is_running_st:read()
--         local xdg_config = os.getenv("XDG_CONFIG_HOME")

--         is_running_st:close()
--         io.popen(string.format(format, xdg_config, xdg_config, pids)):close()
--       end
--     end,
--     options = {
--       desc = "Removes padding from st when Nvim disconnects from the UI.",
--     },
--   },
-- })

-- vim:ft=lua
