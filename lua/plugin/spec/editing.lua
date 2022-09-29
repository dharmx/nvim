--- NOTE: This file contains plugins that assists general code editing.
--- NOTE: Such as syntax highlighting, build helpers, URL highlights, previews, etc.
local use = require("packer").use

local disabled = require("control.disabled")

use({
  "protex/better-digraphs.nvim",
  after = "telescope.nvim",
  setup = function()
    require("plugin.config.editing.digraph")
  end,
  disable = disabled["better-digraphs.nvim"],
})

use({
  "sheerun/vim-polyglot",
  event = "UIEnter",
  disable = disabled["vim-polyglot"],
})

use({
  "fedepujol/move.nvim",
  event = "InsertEnter",
  config = function()
    require("plugin.config.editing.move")
  end,
  disable = disabled["move.nvim"],
})

use({
  "bhurlow/vim-parinfer",
  ft = "yuck",
  disable = disabled["vim-parinfer"],
})

use({
  "lervag/vimtex",
  ft = "tex",
  disable = disabled["vimtex"],
})

use({
  "xuhdev/vim-latex-live-preview",
  ft = "tex",
  disable = disabled["vim-latex-live-preview"],
})

use({
  "aspeddro/pandoc.nvim",
  ft = {
    "markdown",
    "tex",
    "xml",
    "org",
    "html",
    "plaintext",
    "txt",
  },
  disable = disabled["pandoc.nvim"],
  config = function()
    require("plugin.config.editing.pandoc")
  end,
})

use({ "Fymyte/rasi.vim", ft = "rasi", disable = disabled["rasi.vim"] })
use({ "elkowar/yuck.vim", ft = "yuck", disable = disabled["yuck.vim"] })
use({ "kovetskiy/sxhkd-vim", ft = "sxhkd", disable = disabled["sxhkd-vim"] })
use({ "MTDL9/vim-log-highlighting", ft = "log", disable = disabled["vim-log-highlighting"] })
use({ "vuki656/package-info.nvim", ft = "package.json", disable = disabled["package-info.nvim"] })

use({
  "TimUntersberger/neogit",
  cmd = "Neogit",
  module = "neogit",
  disable = disabled["neogit"],
})

use({
  "lewis6991/gitsigns.nvim",
  cmd = "Gitsigns",
  config = function()
    require("plugin.config.editing.gitsigns")
  end,
  module = "gitsigns",
  disable = disabled["gitsigns.nvim"],
})

use({
  "numToStr/Comment.nvim",
  config = function()
    require("plugin.config.editing.comments")
  end,
  event = { "CursorMoved", "InsertEnter" },
  disable = disabled["Comment.nvim"],
})

use({
  "folke/todo-comments.nvim",
  event = { "CmdlineEnter", "InsertEnter", "CursorMoved", "CursorHold" },
  config = function()
    require("plugin.config.editing.todo")
  end,
  disable = disabled["todo-comments.nvim"],
})

use({
  "ellisonleao/glow.nvim",
  cmd = "Glow",
  setup = function()
    require("plugin.config.editing.glow")
  end,
  disable = disabled["glow.nvim"],
})

use({
  "iamcco/markdown-preview.nvim",
  setup = function()
    require("plugin.config.editing.mdpreview")
  end,
  run = "cd app && yarn install",
  ft = "markdown",
  disable = disabled["markdown-preview.nvim"],
})

use({
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerAttachToBuffers",
    "ColorizerDetachFromBuffers",
  },
  disable = disabled["nvim-colorizer.lua"],
})

use({
  "chrisbra/Colorizer",
  cmd = {
    "ColorToggle",
    "ColorClear",
    "ColorContrast",
    "ColorHighlight",
    "ColorSwapFgBg",
  },
  disable = disabled["Colorizer"],
})

use({
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  config = function()
    require("plugin.config.editing.trouble")
  end,
  disable = disabled["trouble.nvim"],
})

use({
  "NFrid/due.nvim",
  cmd = { "DueDraw", "DueRedraw", "DueClean", "DueAsyncUpdate" },
  disable = disabled["due.nvim"],
})

use({
  "stevearc/gkeep.nvim",
  run = ":UpdateRemotePlugins",
  after = "telescope.nvim",
  disable = disabled["gkeep.nvim"],
})

use({ "jbyuki/venn.nvim", cmd = "ToggleVenn", disable = disabled["venn.nvim"] })

use({
  "oberblastmeister/neuron.nvim",
  wants = "popup.nvim",
  after = "telescope.nvim",
  disable = disabled["neuron.nvim"],
})

use({
  "nvim-neorg/neorg",
  ft = "norg",
  wants = "nvim-treesitter",
  config = function()
    require("plugin.config.editing.neorg")
  end,
  disable = disabled["neorg"],
})

use({
  "nvim-orgmode/orgmode",
  ft = "org",
  config = function()
    require("plugin.config.editing.orgmode")
  end,
  disable = disabled["orgmode"],
})

use({
  "axieax/urlview.nvim",
  wants = "telescope-ui-select.nvim",
  cmd = "UrlView",
  disable = disabled["urlview.nvim"],
})

use({ "jbyuki/nabla.nvim", after = "orgmode", disable = disabled["nabla.nvim"] })

use({ "phelipetls/vim-hugo", ft = "markdown", disable = disabled["vim-hugo"] })

use({ "robertbasic/vim-hugo-helper", ft = "markdown", disable = disabled["vim-hugo-helper"] })

-- vim:ft=lua
