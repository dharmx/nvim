local M = {}

M["CommitList"] = {
  command = function()
    require("telescope.builtin").git_commits()
  end,
}

M["PersistClip"] = {
  command = function()
    require("telescope").extensions.neoclip.neoclip()
  end,
}

M["EnvList"] = {
  command = function()
    require("telescope").extensions.env.env()
  end,
}

M["Keymaps"] = {
  command = function()
    require("telescope.builtin").keymaps()
  end,
}

M["GitHL"] = {
  command = function()
    require("gitsigns").toggle_signs()
  end,
}

M["FormatConfigAll"] = {
  command = function()
    local config = stdpath "config"
    cmd("silent !stylua --config-path " .. config .. "/.stylua.toml " .. config)
  end,
}

M["LspLog"] = "edit " .. lsp.get_log_path()
M["NvimLog"] = "edit " .. stdpath "cache" .. "/log"
M["PackerLog"] = "edit " .. stdpath "cache" .. "/packer.nvim.log"
M["TelescopeLog"] = "edit " .. stdpath "cache" .. "/telescope.log"

M["TSStart"] = {
  command = function()
    pcall(require("packer").loader, "nvim-treesitter")
  end,
}

M["TabLineTGL"] = "if &stal == 2 | setlocal stal=0 | else | setlocal stal=2 | endif"

M["StatusLineTGL"] = {
  command = function()
    if o.laststatus == 0 then
      o.laststatus = 3
    else
      o.laststatus = 0
    end
  end,
}

M["NumberColumnTGL"] = "setlocal nu!"

M["RelativeNumberColumnTGL"] = "setlocal rnu!"

M["SpellingTGL"] = "setlocal spell!"

M["SpotifyExit"] = {
  command = function()
    api.nvim_exec("silent !killall spotifyd", false)
  end,
}

M["StartupTime"] = {
  command = function()
    local path = stdpath "config" .. "/.startup-time.log"
    api.nvim_exec(string.format("silent !nvim --startuptime %s dummy", path), false)
    cmd("edit " .. path)
  end,
}

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
  },
}

M["PackerClean"] = {
  command = function()
    require("packer").clean()
  end,
  options = { force = true },
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
  },
}

M["PackerProfile"] = {
  command = function()
    require("packer").profile_output()
  end,
  options = { force = true },
}

M["PackerStatus"] = {
  command = function()
    require("packer").status()
  end,
  options = { force = true },
}

return M

-- vim:ft=lua
