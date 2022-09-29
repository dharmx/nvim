--- Global scoped user command list.

local nv = require("utils.neovim")
local alias = nv.alias
local unalias = nv.unalias
local lsp = vim.lsp
local fn = vim.fn
local cmd = vim.cmd

alias("LoadNullLsp", function()
  require("null-ls")
end, {
  desc = "Load null-ls.nvim.",
})

alias("ScratchTele", function()
  if not packer_plugins["scratch.nvim"].loaded then
    require("packer").loader("scratch.nvim")
  end
  require("telescope").extensions.scratch.scratch()
end, {
  desc = "Load and create a new scratch file, with telescope.",
})

alias("CommitList", function()
  require("telescope.builtin").git_commits()
end, {
  desc = "View git commits in a telescope window.",
})

alias("Shade", function()
  require("packer").loader("shade.nvim")
end, {
  desc = "Load shade.nvim heath plugin.",
})

alias("PersistClip", function()
  require("telescope").extensions.neoclip.neoclip()
end, {
  desc = "Telescope extension for clipboards. Basically, a clipboard manager.",
})

alias("EnvList", function()
  require("telescope").extensions.env.env()
end, {
  desc = "View env variables within a telescope window.",
})

alias("Keymaps", function()
  require("telescope.builtin").keymaps()
end, {
  desc = "View all mapped keys within a telescope window.",
})

alias("GitHL", function()
  require("gitsigns").toggle_signs()
end, {
  desc = "Toggle delete/changed/add git number column signs provided by, gitsigns.nvim",
})

alias("LspLog", "edit " .. lsp.get_log_path(), {
  desc = "View/Edit LSP log file.",
})

alias("NvimLog", "edit " .. fn.stdpath("cache") .. "/log", {
  desc = "View/Edit neovim log file.",
})

alias("PackerLog", "edit " .. fn.stdpath("cache") .. "/packer.nvim.log", {
  desc = "View/Edit packer.nvim log file.",
})

alias("TelescopeLog", "edit " .. fn.stdpath("cache") .. "/telescope.log", {
  desc = "View/Edit telescope.nvim log file.",
})

alias("TSStart", "TSUpdate", {
  desc = "Load treesitter plugin.",
})

alias("TabLineTGL", "if &stal == 2 | setlocal stal=0 | else | setlocal stal=2 | endif", {
  desc = "Hide/Unhide tabline.",
})

alias("StatusLineTGL", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3
  else
    vim.o.laststatus = 0
  end
end, {
  desc = "Hide/Unhide statusline.",
})

alias("NumberColumnTGL", "setlocal nu!", {
  desc = "Hide/Unhide number column.",
})

alias("RelativeNumberColumnTGL", "setlocal rnu!", {
  desc = "Turn on/off relative number column.",
})

alias("SpellingTGL", "setlocal spell!", {
  desc = "Turn on/off spellcheck.",
})

-- NOTE: The following commands are for packer. This is required as we are lazy-loading packer.

alias("PackerSnapshot", function(args)
  local snapshot = require("packer").snapshot
  if args.args == "" then
    snapshot()
    return
  end
  snapshot(unpack(args.fargs))
end, {
  nargs = "+",
  complete = function()
    return require("packer.snapshot").completion.create
  end,
  force = true,
  desc = "Creates a snapshot file that will live under config.snapshot_path/<snapshot_name>.",
})

alias("PackerSnapshotRollback", function(args)
  local rollback = require("packer").rollback
  if args.args == "" then
    rollback()
    return
  end
  rollback(unpack(args.fargs))
end, {
  nargs = "+",
  complete = function()
    return require("packer.snapshot").completion.rollback
  end,
  force = true,
  desc = "Rollback plugins status a snapshot file that will live under config.snapshot_path/<snapshot_name>.",
})

alias("PackerSnapshotDelete", function(args)
  local delete = require("packer").delete
  if args.args == "" then
    delete()
    return
  end
  delete(unpack(args.fargs))
end, {
  nargs = "+",
  complete = function()
    return require("packer.snapshot").completion.snapshot
  end,
  force = true,
  desc = "Deletes a snapshot file under config.snapshot_path/<snapshot_name>.",
})

alias("PackerInstall", function(args)
  local install = require("packer").install
  if args.args == "" then
    install()
    return
  end
  install(unpack(args.fargs))
end, {
  nargs = "*",
  complete = function()
    return require("packer").plugin_complete
  end,
  force = true,
  desc = "Install the specified plugins if they are not already installed.",
})

alias("PackerUpdate", function(args)
  require("packer").update(unpack(args.fargs))
end, {
  nargs = "*",
  complete = function()
    return require("packer").plugin_complete
  end,
  force = true,
  desc = "Update the specified plugins, installing any that are missing.",
})

alias("PackerSync", function(args)
  local sync = require("packer").sync
  if args.args == "" then
    sync()
    return
  end
  sync(unpack(args.fargs))
end, {
  nargs = "*",
  complete = function()
    return require("packer").plugin_complete
  end,
  force = true,
  desc = "Perform a clean followed by an update.",
})

alias("PackerLoad", function(args)
  require("packer").loader(args.args, args.bang)
end, {
  nargs = "+",
  bang = true,
  complete = function()
    return require("packer").loader_complete
  end,
  force = true,
  desc = "Loads opt plugin immediately.",
})

alias("PackerClean", function()
  require("packer").clean()
end, {
  force = true,
  desc = "Remove any disabled or unused plugins.",
})

alias("PackerCompile", function(args)
  local compile = require("packer").compile
  if args.args == "" then
    compile()
    return
  end
  compile(args.args)
end, {
  force = true,
  nargs = "?",
  desc = "Compile lazy-loader code and save to path.",
})

alias("PackerProfile", function()
  require("packer").profile_output()
end, {
  force = true,
  desc = "View load time of plugins.",
})

alias("PackerStatus", function()
  require("packer").status()
end, {
  force = true,
  desc = "View all installed plugins with load status.",
})

require("utils.format")

-- vim:ft=lua
