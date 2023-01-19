local ok, mason_dap = pcall(require, "mason-nvim-dap")
if not ok then return end
local MainConfig = require("dharmx")
local dap = require("dap")

mason_dap.setup({
  ensure_installed = MainConfig.tools.dap,
  automatic_installation = true,
  automatic_setup = true,
})

mason_dap.setup_handlers({
  function(source_name) require("mason-nvim-dap.automatic_setup")(source_name) end,
  python = function()
    dap.adapters.python = {
      type = "executable",
      command = "/usr/bin/python3",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
      },
    }
  end,
})

-- vim:filetype=lua
