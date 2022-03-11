local util = require "packer.util"

local config = {
  ensure_dependencies = true,
  compile_path = util.join_paths(stdpath "config", "lua", "_compiled.lua"),
  auto_clean = true,
  compile_on_sync = true,
  max_jobs = 50,
  disable_commands = false,
  depth = 1,
  clone_timeout = 60,
  default_url_format = "https://github.com/%s.git",
  auto_reload_compiled = true,
  luarocks = { python_cmd = "python" },
  log = { level = "info" },
  profile = { enable = true, threshold = 1 },
}

config.display = {
  non_interactive = false,
  open_cmd = "65vnew \\[packer\\]",
  item_sym = "",
  header_lines = 2,
  title = " packer.nvim",
  working_sym = " ",
  error_sym = "",
  done_sym = "",
  removed_sym = "",
  moved_sym = " ",
  -- header_sym = "━ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ━",
  -- header_sym = "▃",
  show_all_info = false,
  prompt_border = "single",
  keybindings = require("mappings").packer_nvim,
  open_fn = function()
    -- local width = 65
    -- local height = 40
    -- local col = math.ceil((o.columns - width) * 1.05)
    -- local row = math.ceil((o.lines - height) * 0.8 - 1)
    local borders = {
      rounded = "rounded",
      single = "single",
      double = "double",
      none = "none",
      solid = "solid",
      shadow = "shadow",
      custom = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }

    return util.float {
      border = borders.single,
    }
  end,
}

return config

-- vim:ft=lua
