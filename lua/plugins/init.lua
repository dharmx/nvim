local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.notify "packer.nvim doesn't exist. Cloning..."
  bootstrap = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.api.nvim_command "packadd packer.nvim"
end

local packer = require "packer"
local util = require "packer.util"

packer.init {
  ensure_dependencies = true,
  compile_path = util.join_paths(vim.fn.stdpath "config", "lua", "packer_compiled.lua"),
  auto_clean = true,
  compile_on_sync = true,
  max_jobs = 50,
  disable_commands = false,
  depth = 1,
  clone_timeout = 60,
  default_url_format = "https://github.com/%s.git",
  auto_reload_compiled = true,
  display = {
    non_interactive = false,
    open_fn = function()
      return util.float { border = "rounded" }
    end,
    open_cmd = "65vnew \\[packer\\]",
    item_sym = "",
    header_lines = 2,
    title = " packer.nvim",
    working_sym = " ",
    error_sym = "",
    done_sym = "",
    removed_sym = " ",
    moved_sym = " ",
    header_sym = "━ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ━",
    show_all_info = false,
    prompt_border = "rounded",
    keybindings = require("mappings.unknown").packer,
  },
  luarocks = { python_cmd = "python" },
  log = { level = "info" },
  profile = { enable = true, threshold = 1 },
}

use = packer.use
packer.reset()

for _, category in
  ipairs {
    "cmp",
    "code",
    "core",
    "dev",
    "flow",
    "health",
    "misc",
    "theme",
    "util",
  }
do
  require("plugins." .. category)
end

if bootstrap then
  packer.install()
  packer.compile()
  vim.api.nvim_notify("Krakenvim is now ready to go!", vim.log.levels.INFO, { title = "packer.nvim", icon = " " })
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})
