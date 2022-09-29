local packer_util = require("packer.util")

local config = {
  ensure_dependencies = true,
  compile_path = vim.fn.stdpath("config") .. "/lua/plugin/compiledSpec.lua",
  auto_clean = true,
  compile_on_sync = true,
  max_jobs = 30,
  disable_commands = false,
  depth = 1,
  clone_timeout = 30,
  default_url_format = "https://github.com/%s.git",
  auto_reload_compiled = true,
  luarocks = { python_cmd = "python" },
  log = { level = "warn" },
  profile = {
    enable = true,
    threshold = 1,
  },
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
  show_all_info = true,
  prompt_border = "solid",
  keybindings = { quit = "q", toggle_info = "<CR>", diff = "d", prompt_revert = "r" },
  open_fn = function()
    return packer_util.float({
      border = "solid",
    })
  end,
}

return config

-- vim:ft=lua
