local install_path = stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.notify "packer.nvim doesn't exist. Cloning..."
  bootstrap = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  cmd "packadd packer.nvim"
end

local packer = require "packer"
packer.init(require "configs.packer")
local use = packer.use
packer.reset()

use {
  "jose-elias-alvarez/null-ls.nvim",
  wants = "plenary.nvim",
  cmd = "NullLsLoad",
  module = "null-ls",
  disable = true,
}

use {
  "ThePrimeagen/refactoring.nvim",
  after = { "null-ls.nvim", "telescope.nvim" },
  config = function()
    require "configs.refactoring"
    require("telescope").load_extension "refactoring"
  end,
  disable = true,
}

use {
  "williamboman/nvim-lsp-installer",
  config = function()
    require "configs.lsp"
  end,
  wants = { "nvim-lspconfig" },
  cmd = {
    "LspInstallInfo",
    "LspInstallLog",
    "LspInstall",
    "LspUpdateAll",
    "LspStart",
    "LspInfo",
    "LspPrintInstalled",
    "LspRestart",
    "LspStop",
    "LspUninstall",
    "LspUninstallall",
  },
}

use { "b0o/schemastore.nvim", module = "schemastore" }

use {
  "glepnir/lspsaga.nvim",
  after = "nvim-lspconfig",
  config = function()
    require "configs.lsp.lspsaga"
  end,
  disable = true,
}

use {
  "kosayoda/nvim-lightbulb",
  after = "nvim-lsp-installer",
  config = function()
    vim.api.nvim_command "autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()"
  end,
  disable = true,
}

use {
  "neovim/nvim-lspconfig",
  opt = true,
}

use {
  "simrat39/symbols-outline.nvim",
  config = function()
    require "configs.lsp.outline"
  end,
  after = "nvim-lspconfig",
  cmd = {
    "SymbolsOutline",
    "SymbolsOutlineClose",
    "SymbolsOutlineOpen",
  },
  disable = true,
}

use {
  "ray-x/lsp_signature.nvim",
  after = "nvim-lspconfig",
  config = function()
    require "configs.lsp.signature"
  end,
  disable = true,
}

use { "nvim-treesitter/nvim-treesitter-refactor", opt = true }
use { "p00f/nvim-ts-rainbow", opt = true }
use { "nvim-treesitter/nvim-treesitter-textobjects", opt = true }
use { "nvim-treesitter/playground", opt = true }
use { "windwp/nvim-ts-autotag", opt = true }

use {
  "romgrk/nvim-treesitter-context",
  after = "nvim-treesitter",
  config = function()
    require "configs.treesitter.plugins.context"
  end,
}

use {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require "configs.treesitter"
  end,
  wants = {
    "nvim-treesitter-refactor",
    "nvim-ts-rainbow",
    "nvim-treesitter-textobjects",
    "playground",
    "nvim-ts-autotag",
  },
  cmd = "TSStart",
}

use {
  "SmiteshP/nvim-gps",
  after = "nvim-treesitter",
  config = function()
    require "configs.treesitter.plugins.gps"
  end,
}

use {
  "lewis6991/spellsitter.nvim",
  config = function()
    require "configs.treesitter.plugins.spellsitter"
  end,
  after = "nvim-treesitter",
  disable = true,
}

use {
  "hrsh7th/nvim-cmp",
  wants = "cmp-under-comparator",
  config = function()
    require "configs.cmp"
  end,
  event = "InsertEnter",
}

use {
  "lukas-reineke/cmp-under-comparator",
  module = "cmp-under-comparator",
}

use {
  "tamago324/cmp-zsh",
  after = "nvim-cmp",
  ft = "zsh",
  config = function()
    require "configs.cmp.zsh"
  end,
}

use {
  "uga-rosa/cmp-dictionary",
  after = "nvim-cmp",
  config = function()
    require "configs.cmp.dictionary"
  end,
  disable = true,
}

use {
  "L3MON4D3/LuaSnip",
  after = "nvim-cmp",
  config = function()
    require "configs.cmp.luasnip"
  end,
}

use {
  "windwp/nvim-autopairs",
  after = "nvim-cmp",
  module = "nvim-autopairs",
  config = function()
    require "configs.cmp.autopairs"
  end,
}

use {
  "petertriho/cmp-git",
  wants = "plenary.nvim",
  config = function()
    require "configs.cmp.git"
  end,
  after = "nvim-cmp",
  disable = true,
}

use {
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  after = { "nvim-lspconfig", "nvim-cmp" },
  disable = true,
}

use {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  after = { "nvim-cmp", "nvim-lspconfig" },
  disable = true,
}

use {
  "dmitmel/cmp-cmdline-history",
  after = "nvim-cmp",
  event = "CmdlineEnter",
  disable = true,
}

use {
  "quangnguyen30192/cmp-nvim-tags",
  after = "nvim-cmp",
  ft = { "md", "markdown", "html", "xml", "javascript", "js" },
  disable = true,
}

use {
  "David-Kunz/cmp-npm",
  after = "nvim-cmp",
  ft = "package.json",
  disable = true,
  wants = "plenary.nvim",
}

use {
  "andersevenrud/cmp-tmux",
  after = "nvim-cmp",
  ft = { "sh", "bash", "zsh", "fish", "conf" },
  disable = true,
}

use {
  "hrsh7th/cmp-emoji",
  after = "nvim-cmp",
  disable = true,
}

use {
  "hrsh7th/cmp-nvim-lsp",
  after = { "nvim-lspconfig", "nvim-cmp" },
  config = function()
    require "configs.cmp.lsp"
  end,
}

use {
  "hrsh7th/cmp-calc",
  after = "nvim-cmp",
  disable = true,
}

use { "octaltree/cmp-look", after = "nvim-cmp", disable = true }
use { "f3fora/cmp-spell", after = "nvim-cmp" }
use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
use { "lukas-reineke/cmp-rg", after = "nvim-cmp" }
use { "ray-x/cmp-treesitter", after = { "nvim-cmp", "nvim-treesitter" } }
use { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", ft = "lua" }
use { "mtoohey31/cmp-fish", ft = "fish", after = "nvim-cmp", ft = "fish" }
use { "kdheepak/cmp-latex-symbols", ft = "tex", wants = "nvim-cmp" }
use { "saadparwaiz1/cmp_luasnip", after = { "LuaSnip", "nvim-cmp" } }
use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
use { "hrsh7th/cmp-path", after = "cmp-buffer" }

use {
  "wbthomason/packer.nvim",
  module = "packer",
  wants = "plenary.nvim",
  config = function()
    require "plugins"
  end,
}

use { "lewis6991/impatient.nvim" }

use {
  "euclidianAce/BetterLua.vim",
  ft = "lua",
  setup = function()
    require "configs.betterlua"
  end,
}

use { "tjdevries/vlog.nvim", disable = true }
use { "bfredl/nvim-luadev", cmd = "Luadev" }
use { "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } }
use { "milisims/nvim-luaref", ft = { "vim", "lua" } }
use { "nanotee/luv-vimdocs", ft = { "vim", "lua" } }
use { "nanotee/nvim-lua-guide", ft = { "vim", "lua" } }

use { "Fymyte/rasi.vim", ft = "rasi" }
use { "elkowar/yuck.vim", ft = "yuck" }
use { "kovetskiy/sxhkd-vim", ft = "sxhkdrc" }
use { "MTDL9/vim-log-highlighting", ft = "log" }
use { "vuki656/package-info.nvim", ft = "package.json", disable = true }

use {
  "danymat/neogen",
  wants = "nvim-treesitter",
  disable = true,
}

use { "sheerun/vim-polyglot" }

use {
  "TimUntersberger/neogit",
  wants = "plenary.nvim",
  cmd = "Neogit",
  module = "neogit",
  disable = true,
}

use {
  "lewis6991/gitsigns.nvim",
  wants = "plenary.nvim",
  cmd = "Gitsigns",
  config = function()
    require "configs.gitsigns"
  end,
}

use { "numToStr/Comment.nvim", module = "Comment" }

use {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require "configs.todocomments"
  end,
}

use {
  "iamcco/markdown-preview.nvim",
  setup = function()
    require "configs.mdpreview"
  end,
  run = "cd app && yarn install",
  ft = "markdown",
}

use {
  "norcalli/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerAttachToBuffers",
    "ColorizerDetachFromBuffers",
  },
}

use {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  config = function()
    require "configs.trouble"
  end,
  disable = true,
}

use {
  "NFrid/due.nvim",
  cmd = {
    "DueDraw",
    "DueRedraw",
    "DueClean",
    "DueAsyncUpdate",
  },
  disable = true,
}

use {
  "stevearc/gkeep.nvim",
  run = ":UpdateRemotePlugins",
  after = "telescope.nvim",
  disable = true,
}

use {
  "jbyuki/venn.nvim",
  cmd = "ToggleVenn",
  disable = true,
}

use {
  "oberblastmeister/neuron.nvim",
  wants = { "popup.nvim", "plenary.nvim" },
  after = "telescope.nvim",
  disable = true,
}

use {
  "nvim-neorg/neorg",
  ft = "norg",
  after = "nvim-treesitter",
  config = function()
    require "configs.neorg"
  end,
  disable = true,
}

use {
  "nvim-orgmode/orgmode",
  ft = "org",
  config = function()
    require "configs.orgmode"
  end,
  disable = true,
}

use {
  "jbyuki/nabla.nvim",
  after = "orgmode",
  disable = true,
}

use {
  "xiyaowong/nvim-transparent",
  cmd = { "TransparentDisable", "TransparentEnable", "TransparentToggle" },
  config = function()
    require "configs.transparent"
  end,
  disable = true,
}

use {
  "sunjon/shade.nvim",
  disable = true,
}

use {
  "folke/twilight.nvim",
  cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  config = function()
    require "configs.twilight"
  end,
  disable = true,
}

use {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  config = function()
    require "configs.zenmode"
  end,
  disable = true,
}

use {
  "Pocco81/TrueZen.nvim",
  cmd = { "TZAtaraxisOn", "TZAtaraxisOff", "TZMinimalistOn", "TZMinimalistOff", "TZFocusOn", "TZFocusOff" },
  disable = true,
}

use {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  disable = true,
}

use {
  "junegunn/limelight.vim",
  after = "goyo.vim",
  disable = true,
}

use {
  "rinx/nvim-minimap",
  cmd = { "MinimapOpen", "MinimapClose", "MinimapRefresh", "MinimapToggle" },
  disable = true,
}

use {
  "tpope/vim-dispatch",
  cmd = { "Dispatch", "Make", "Focus", "Start" },
  disable = true,
}

use {
  "andweeb/presence.nvim",
  event = "InsertEnter",
  config = function()
    require "configs.presence"
  end,
}

use {
  "wakatime/vim-wakatime",
  event = "InsertEnter",
}

use {
  "KadoBOT/nvim-spotify",
  wants = "telescope.nvim",
  config = function()
    require "configs.spotify"
  end,
  run = "make",
  cmd = { "SpotifyDevices", "Spotify" },
}

use {
  "karb94/neoscroll.nvim",
  cmd = {
    "NeoscrollEnablePM",
    "NeoscrollEnableGlobalPM",
    "NeoscrollDisablePM",
    "NeoscrollDisableGlobalePM",
    "NeoscrollEnableBufferPM",
    "NeoscrollDisableBufferPM",
  },
  config = function()
    require "configs.neoscroll"
  end,
  disable = true,
}

use {
  "Xuyuanp/scrollbar.nvim",
  events = { "WinScrolled", "VimResized", "QuitPre" },
  setup = function()
    require "configs.scrollbar"
  end,
  disable = true,
}

use {
  "akinsho/bufferline.nvim",
  config = function()
    require "configs.bufferline"
  end,
}

use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "configs.devicons"
  end,
}

use {
  "lukas-reineke/indent-blankline.nvim",
  cmd = {
    "IndentBlanklineEnable",
    "IndentBlanklineDisable",
    "IndentBlanklineToggle",
    "IndentBlanklineRefresh",
    "IndentBlanklineRefreshScroll",
  },
  config = function()
    require "configs.blankline"
  end,
  disable = true,
}

use {
  "VonHeikemen/fine-cmdline.nvim",
  cmd = "FineCmdline",
  config = function()
    require "configs.finecmdline"
  end,
  disable = true,
}

use {
  "VonHeikemen/searchbox.nvim",
  cmd = "SearchBoxIncSearch",
  config = function()
    require "configs.searchbox"
  end,
  disable = true,
}

use {
  "glepnir/dashboard-nvim",
  setup = function()
    require "configs.dashboard"
  end,
  cmd = {
    "Dashboard",
    "DashboardChangeColorscheme",
    "DashboardFindFile",
    "DashboardFindHistory",
    "DashboardFindWord",
    "DashboardJumpMarks",
    "DashboardNewFile",
  },
}

use { "nvim-lua/plenary.nvim", opt = true }

use { "nvim-lua/popup.nvim" }

use { "nathom/filetype.nvim" }

use { "luukvbaal/stabilize.nvim", event = { "CmdlineEnter", "InsertEnter" } }

use {
  "rcarriga/nvim-notify",
  config = function()
    require "configs.notify"
  end,
}

use { "MunifTanjim/nui.nvim", module = "nui" }

use { "tami5/sqlite.lua", module = "sqlite" }

use {
  "dstein64/vim-startuptime",
  cmd = "StartupTime",
  disable = true,
}

use {
  "gyim/vim-boxdraw",
}

use {
  "tweekmonster/haunted.vim",
  cmd = "Haunt",
  disable = true,
}

use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
  setup = require("configs.nvimtree").before,
  config = require("configs.nvimtree").after,
  wants = "nvim-notify",
}

use {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  wants = "plenary.nvim",
  config = function()
    require "configs.telescope"
    require("telescope").load_extension "notify"
  end,
}

use {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").load_extension "ui-select"
  end,
  after = "telescope.nvim",
  disable = true,
}
use {
  "nvim-telescope/telescope-smart-history.nvim",
  config = function()
    require("telescope").load_extension "smart_history"
  end,
  wants = "sqlite.lua",
  after = "telescope.nvim",
  disable = true,
}

use {
  "nvim-telescope/telescope-arecibo.nvim",
  rocks = { "openssl", "lua-http-parser" },
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "arecibo"
  end,
  disable = true,
}

use {
  "AckslD/nvim-neoclip.lua",
  after = "telescope.nvim",
  config = function()
    require "configs.telescope.extensions.neoclip"
    require("telescope").load_extension "neoclip"
  end,
}

use {
  "nvim-telescope/telescope-fzf-native.nvim",
  run = "make",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "fzf"
  end,
}

use {
  "https://code.sitosis.com/rudism/telescope-dict.nvim.git",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "dict"
  end,
  disable = true,
}

use {
  "LinArcX/telescope-command-palette.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "command_palette"
  end,
  disable = true,
}

use {
  "LinArcX/telescope-env.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "env"
  end,
}

use {
  "sudormrfbin/cheatsheet.nvim",
  requires = { "popup.nvim", "plenary.nvim" },
  config = function()
    require "configs.telescope.extensions.cheatsheet"
    require("telescope").load_extension "cheatsheet"
  end,
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  after = "telescope.nvim",
}

use {
  "nvim-telescope/telescope-node-modules.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "node_modules"
  end,
  disable = true,
}

use {
  "benfowler/telescope-luasnip.nvim",
  config = function()
    require("telescope").load_extension "luasnip"
  end,
  after = { "LuaSnip", "telescope.nvim" },
  disable = true,
}

use {
  "xiyaowong/telescope-emoji.nvim",
  after = "telescope.nvim",
  config = function()
    require "configs.telescope.extensions.emoji"
    require("telescope").load_extension "emoji"
  end,
  disable = true,
}

use {
  "crispgm/telescope-heading.nvim",
  wants = "telescope.nvim",
  ft = { "md", "markdown" },
  config = function()
    require("telescope").load_extension "heading"
  end,
}

use {
  "dhruvmanila/telescope-bookmarks.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "bookmarks"
  end,
}

use {
  "nvim-telescope/telescope-frecency.nvim",
  after = "telescope.nvim",
  wants = "sqlite.lua",
  config = function()
    require("telescope").load_extension "frecency"
  end,
  disable = true,
}

use {
  "TC72/telescope-tele-tabby.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "tele_tabby"
  end,
  disable = true,
}

use {
  "cljoly/telescope-repo.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "repo"
  end,
}

use {
  "nvim-telescope/telescope-symbols.nvim",
  after = "telescope.nvim",
}

use {
  "pagankeymaster/telescope-media-files.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "media_files"
  end,
}

use {
  "nvim-telescope/telescope-project.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "project"
  end,
}

use {
  "nvim-telescope/telescope-packer.nvim",
  after = { "packer.nvim", "telescope.nvim" },
  config = function()
    require("telescope").load_extension "packer"
  end,
}

use {
  "nvim-telescope/telescope-file-browser.nvim",
  after = "telescope.nvim",
  config = function()
    require("telescope").load_extension "file_browser"
  end,
}

use {
  "pagankeymaster/telescope-cheat.nvim",
  config = function()
    require("telescope").load_extension "cheat"
  end,
  after = "telescope.nvim",
  disable = true,
}

use {
  "phaazon/hop.nvim",
  cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2", "HopPattern" },
  as = "hop",
  config = function()
    require "configs.hop"
  end,
  disable = true,
}

use {
  "Pocco81/AutoSave.nvim",
  cmd = { "ASOn", "ASOff", "ASToggle" },
  config = function()
    require "configs.autosave"
  end,
}

use { "Shatur/neovim-session-manager", cmd = "SessionManager" }

use { "andymass/vim-matchup", opt = true }

use {
  "mbbill/undotree",
  opt = true,
  disable = true,
}

use {
  "max397574/better-escape.nvim",
  config = function()
    require "configs.betteresc"
  end,
  keys = require("mappings").better_escape_nvim,
  disable = true,
}

use {
  "abecodes/tabout.nvim",
  disable = true,
}

use {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  disable = true,
}

use {
  "folke/which-key.nvim",
  config = function()
    require "configs.whichkey"
  end,
}

use {
  "ggandor/lightspeed.nvim",
  cmd = "LightSpeedInit",
  disable = true,
}

use {
  "bennypowers/nvim-regexplainer",
  config = function()
    require "configs.regexplainer"
  end,
  wants = { "plenary.nvim", "nui.nvim", "nvim-treesitter" },
  cmd = {
    "RegexplainerHide",
    "RegexplainerShow",
    "RegexplainerShowPopup",
    "RegexplainerShowSplit",
  },
  disable = true,
}

use {
  "winston0410/cmd-parser.nvim",
  event = "CmdlineEnter",
  disable = true,
}

use {
  "nvim-pack/nvim-spectre",
  disable = true,
}

if bootstrap then
  packer.clean()
  packer.install()
  packer.compile()
end

return setmetatable({}, {
  __index = function(_, operation)
    return packer[operation]
  end,
})

-- vim:ft=lua
