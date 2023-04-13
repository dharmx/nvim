local ok, mason_dap = pcall(require, "mason-nvim-dap")
if not ok then return end
local dap = require("dap")

mason_dap.setup({
  ensure_installed = { "python", "cppdbg", "bash", "javadbg", "javatest" },
  automatic_installation = true,
  automatic_setup = true,
})

mason_dap.setup({
  handlers = {
    function(source_name)
      local auto_setup = require("mason-nvim-dap.automatic_setup")
      auto_setup(source_name)
    end,
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
  }
})
