colorscheme fallback

let settings = stdpath('config') . '/settings/*'
for file in glob(settings, 0, 1) | exe 'so ' . file | endfor
for prov in ['node', 'perl', 'python3', 'ruby'] | let g:['loaded_' . prov . '_provider'] = 0 | endfor

lua << EOF
require("dharmx.plugins").exclude_and_load({
  "mfussenegger/nvim-jdtls",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "rafcamlet/nvim-luapad",
  "karb94/neoscroll.nvim",
  "vijaymarupudi/nvim-fzf",
  "ckolkey/ts-node-action",
  "chrisgrieser/nvim-various-textobjs",
  "petertriho/nvim-scrollbar",
  "lukas-reineke/virt-column.nvim",
  "mrjones2014/nvim-ts-rainbow",
  "Pocco81/TrueZen.nvim",
  "kevinhwang91/nvim-hlslens",
  "mbbill/undotree",
  "akinsho/bufferline.nvim",
  "danymat/neogen",
  "anuvyklack/pretty-fold.nvim",
  "kevinhwang91/nvim-hlslens",
  "goolord/alpha-nvim",
  "doums/monark.nvim",
  "b0o/schemastore.nvim",
  "kosayoda/nvim-lightbulb",
  "simrat39/rust-tools.nvim",
  "Fymyte/rasi.vim",
  "folke/trouble.nvim",
  "yamatsum/nvim-cursorline",
  "b0o/incline.nvim",
  "andweeb/presence.nvim",
  "rktjmp/paperplanes.nvim",
  "nvim-treesitter/nvim-tree-docs",
  "windwp/nvim-ts-autotag",
  "wakatime/vim-wakatime",
  "windwp/nvim-ts-autotag",
})
EOF
