local M = {}

M["CommitList"] = {
  command = function()
    local _ = require("telescope.builtin").git_commits()
  end,
}

M["EnvList"] = {
  command = function()
    local _ = require("telescope").extensions.env.env()
  end,
}

M["Keymaps"] = {
  command = function()
    local _ = require("telescope.builtin").keymaps()
  end,
}

M["GitHL"] = {
  command = function()
    local _ = require("gitsigns").toggle_signs()
  end,
}

M["FormatConfigAll"] = {
  command = function()
    local config = stdpath "config"
    cmd("!stylua --config-path " .. config .. "/.stylua.toml " .. config)
  end,
}

M["LspLog"] = "edit " .. lsp.get_log_path()
M["NvimLog"] = "edit " .. stdpath "cache" .. "/log"
M["PackerLog"] = "edit " .. stdpath "cache" .. "/packer.nvim.log"
M["TelescopeLog"] = "edit " .. stdpath "cache" .. "/telescope.log"

M["TSStart"] = {
  command = function()
    local _ = require "configs.treesitter"
  end,
}

M["StartPage"] = "Dashboard | TabLineTGL"

M["TabLineTGL"] = "if &stal == 2 | setlocal stal=0 | else | setlocal stal=2 | endif"

M["StatusLineTGL"] = "if &ls == 2 | setlocal ls=0 | else | setlocal ls=2 | endif"

M["NumberColumnTGL"] = "setlocal nu!"

M["RelativeNumberColumnTGL"] = "setlocal rnu!"

M["SpellingTGL"] = "setlocal spell!"

M["SpotifyExit"] = {
  command = function()
    api.nvim_exec("!killall spotifyd &", false)
  end,
}

M["StartupTime"] = {
  command = function()
    local path = stdpath "config" .. "/.startup-time.log"
    api.nvim_exec(string.format("!nvim --startuptime %s dummy &", path), false)
    cmd("edit " .. path)
  end,
}

M["PackerSnapshot"] = {
  command = function(args)
    local _ = require("packer").snapshot(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = require("packer.snapshot").completion.create,
    force = true,
  },
}

M["PackerSnapshotRollback"] = {
  command = function(args)
    local _ = require("packer").rollback(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = require("packer.snapshot").completion.rollback,
    force = true,
  },
}

M["PackerSnapshotDelete"] = {
  command = function(args)
    local _ = require("packer").delete(unpack(args.fargs))
  end,
  options = {
    nargs = "+",
    complete = require("packer.snapshot").completion.snapshot,
    force = true,
  },
}

M["PackerInstall"] = {
  command = function(args)
    local _ = require("packer").install(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = require("packer").plugin_complete,
    force = true,
  },
}

M["PackerUpdate"] = {
  command = function(args)
    local _ = require("packer").update(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = require("packer").plugin_complete,
    force = true,
  },
}

M["PackerSync"] = {
  command = function(args)
    local _ = require("packer").sync(unpack(args.fargs))
  end,
  options = {
    nargs = "*",
    complete = require("packer").plugin_complete,
    force = true,
  },
}

M["PackerLoad"] = {
  command = function(args)
    local _ = require("packer").loader(args.args, args.bang)
  end,
  options = {
    nargs = "+",
    bang = true,
    complete = require("packer").loader_complete,
    force = true,
  },
}

M["PackerClean"] = {
  command = function()
    local _ = require("packer").clean()
  end,
  options = { force = true },
}

M["PackerCompile"] = {
  command = function(args)
    local _ = require("packer").compile(args.args)
  end,
  options = {
    force = true,
    nargs = "?"
  },
}

M["PackerProfile"] = {
  command = function()
    local _ = require("packer").profile_output()
  end,
  options = { force = true },
}

M["PackerStatus"] = {
  command = function()
    local _ = require("packer").status()
  end,
  options = { force = true },
}

return M

-- vim:ft=lua
