--- Global scoped user command list.
-- @module settings.commands

local M = {}

M["ScratchTele"] = {
  command = function()
    if not packer_plugins["scratch.nvim"].loaded then
      require("packer").loader "scratch.nvim"
    end
    require("telescope").extensions.scratch.scratch()
  end,
  options = { desc = "Load and create a new scratch file, with telescope." },
}

M["CommitList"] = {
  command = function()
    require("telescope.builtin").git_commits()
  end,
  options = { desc = "View git commits in a telescope window." },
}

M["Shade"] = {
  command = function()
    require("packer").loader "shade.nvim"
  end,
  options = { desc = "Load shade.nvim heath plugin." },
}

M["PersistClip"] = {
  command = function()
    require("telescope").extensions.neoclip.neoclip()
  end,
  options = {
    desc = "Telescope extension for clipboards. Basically, a clipboard manager.",
  },
}

M["EnvList"] = {
  command = function()
    require("telescope").extensions.env.env()
  end,
  options = { desc = "View env variables within a telescope window." },
}

M["Keymaps"] = {
  command = function()
    require("telescope.builtin").keymaps()
  end,
  options = { desc = "View all mapped keys within a telescope window." },
}

M["GitHL"] = {
  command = function()
    require("gitsigns").toggle_signs()
  end,
  options = {
    desc = "Toggle delete/changed/add git number column signs provided by, gitsigns.nvim",
  },
}

M["FormatConfigAll"] = {
  command = function()
    local config = stdpath "config"
    cmd("silent !stylua --config-path " .. config .. "/.stylua.toml " .. config)
  end,
  options = { desc = "Format neovim config with stylua." },
}

M["LspLog"] = {
  command = "edit " .. lsp.get_log_path(),
  options = { desc = "View/Edit LSP log file." },
}

M["NvimLog"] = {
  command = "edit " .. stdpath "cache" .. "/log",
  options = { desc = "View/Edit neovim log file." },
}

M["PackerLog"] = {
  command = "edit " .. stdpath "cache" .. "/packer.nvim.log",
  options = { desc = "View/Edit packer.nvim log file." },
}
M["TelescopeLog"] = {
  command = "edit " .. stdpath "cache" .. "/telescope.log",
  options = { desc = "View/Edit telescope.nvim log file." },
}

M["TSStart"] = {
  command = "TSUpdate",
  options = { desc = "Load treesitter plugin." },
}

M["TabLineTGL"] = {
  command = "if &stal == 2 | setlocal stal=0 | else | setlocal stal=2 | endif",
  options = { desc = "Hide/Unhide tabline." },
}

M["StatusLineTGL"] = {
  command = function()
    if o.laststatus == 0 then
      o.laststatus = 3
    else
      o.laststatus = 0
    end
  end,
  options = { desc = "Hide/Unhide statusline." },
}

M["NumberColumnTGL"] = {
  command = "setlocal nu!",
  options = { desc = "Hide/Unhide number column." },
}

M["RelativeNumberColumnTGL"] = {
  command = "setlocal rnu!",
  options = { desc = "Turn on/off relative number column." },
}

M["SpellingTGL"] = {
  command = "setlocal spell!",
  options = { desc = "Turn on/off spellcheck." },
}

M["SpotifyExit"] = {
  command = function()
    api.nvim_exec("silent !killall spotifyd", false)
  end,
  options = { desc = "Kill the spotify daemon." },
}

M["StartupTime"] = {
  command = function()
    local path = stdpath "config" .. "/.startup-time.log"
    api.nvim_exec(string.format("silent !nvim --startuptime %s dummy", path), false)
    cmd("edit " .. path)
  end,
  options = {
    desc = "Save startuptime to a text file and open it in a buffer.",
  },
}

-- NOTE: The following commands are for packer. This is required as we are lazy-loading packer.

M["PackerSnapshot"] = {
  command = function(args)
    local snapshot = require("packer").snapshot
    if args.args == "" then
      snapshot()
      return
    end
    snapshot(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = function()
      return require("packer.snapshot").completion.create
    end,
    force = true,
    desc = "Creates a snapshot file that will live under config.snapshot_path/<snapshot_name>.",
  },
}

M["PackerSnapshotRollback"] = {
  command = function(args)
    local rollback = require("packer").rollback
    if args.args == "" then
      rollback()
      return
    end
    rollback(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = function()
      return require("packer.snapshot").completion.rollback
    end,
    force = true,
    desc = "Rollback plugins status a snapshot file that will live under config.snapshot_path/<snapshot_name>.",
  },
}

M["PackerSnapshotDelete"] = {
  command = function(args)
    local delete = require("packer").delete
    if args.args == "" then
      delete()
      return
    end
    delete(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = function()
      return require("packer.snapshot").completion.snapshot
    end,
    force = true,
    desc = "Deletes a snapshot file under config.snapshot_path/<snapshot_name>.",
  },
}

M["PackerInstall"] = {
  command = function(args)
    local install = require("packer").install
    if args.args == "" then
      install()
      return
    end
    install(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = function()
      return require("packer").plugin_complete
    end,
    force = true,
    desc = "Install the specified plugins if they are not already installed.",
  },
}

M["PackerUpdate"] = {
  command = function(args)
    require("packer").update(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = function()
      return require("packer").plugin_complete
    end,
    force = true,
    desc = "Update the specified plugins, installing any that are missing.",
  },
}

M["PackerSync"] = {
  command = function(args)
    local sync = require("packer").sync
    if args.args == "" then
      sync()
      return
    end
    sync(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = function()
      return require("packer").plugin_complete
    end,
    force = true,
    desc = "Perform a clean followed by an update.",
  },
}

M["PackerLoad"] = {
  command = function(args)
    require("packer").loader(args.args, args.bang)
  end,
  options = {
    nargs = "+",
    bang = true,
    complete = function()
      return require("packer").loader_complete
    end,
    force = true,
    desc = "Loads opt plugin immediately.",
  },
}

M["PackerClean"] = {
  command = function()
    require("packer").clean()
  end,
  options = { force = true, desc = "Remove any disabled or unused plugins." },
}

M["PackerCompile"] = {
  command = function(args)
    local compile = require("packer").compile
    if args.args == "" then
      compile()
      return
    end
    compile(args.args)
  end,
  options = {
    force = true,
    nargs = "?",
    desc = "Compile lazy-loader code and save to path.",
  },
}

M["PackerProfile"] = {
  command = function()
    require("packer").profile_output()
  end,
  options = { force = true, desc = "View load time of plugins." },
}

M["PackerStatus"] = {
  command = function()
    require("packer").status()
  end,
  options = { force = true, desc = "View all installed plugins with load status." },
}

return M

-- vim:ft=lua
