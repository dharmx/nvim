local benchmark = require("plenary.benchmark")

benchmark("Main and modules.", {
  warmup = 1,
  runs = 25,
  fun = {
    {
      "Main init",
      function() -- simulate init.lua
        require("setting")

        local stdpath = vim.fn.stdpath
        local exists = require("utils").exists
        local pk_install = exists(stdpath("data") .. "/site/pack/packer/opt/packer.nvim")

        if not pk_install or not pk_compile then
          require("plugin.spec")
        end

        pcall(require, "configs.core.impatient")
        require("stline").setup()
      end,
    },
    {
      "Plugin specs file",
      function()
        _ = require("plugin.spec")
      end,
    },
    {
      "Settings module",
      function()
        require("setting")
      end,
    },
    {
      "Settings module",
      function()
        require("setting")
      end,
    },
    {
      "Load the plugin manager",
      function()
        require("packer")
      end,
    },
  },
})
