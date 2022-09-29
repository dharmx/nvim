local benchmark = require("plenary.benchmark")

benchmark("Statusline and friends, startup time.", {
  warmup = 1,
  runs = 25,
  fun = {
    {
      "Position and line number",
      function()
        require("stline.modules.position").position()
      end,
    },
    {
      "Diagnostics",
      function()
        require("stline.modules.diagnostics").diagnostics()
      end,
    },
    {
      "Dirname",
      function()
        require("stline.modules.dirname").dirname()
      end,
    },
    {
      "Filename",
      function()
        require("stline.modules.filename").filename()
      end,
    },
    {
      "Git",
      function()
        require("stline.modules.git").git()
      end,
    },
    {
      "Code actions indicator",
      function()
        require("stline.modules.lightbulb").lightbulb()
      end,
    },
    {
      "Short mode",
      function()
        require("stline.modules.mode").mode(true)
      end,
    },
    {
      "Mode",
      function()
        require("stline.modules.mode").mode()
      end,
    },
    {
      "Treesitter",
      function()
        require("stline.modules.treesitter").treesitter()
      end,
    },
    {
      "Full statusline",
      function()
        require("stline").setup()
      end,
    },
  },
})
