# REWRITE

See commit [dd06e88](https://github.com/dharmx/KrakeNvim/tree/dd06e88061589036cf4730e0427ca2d1010ac55f) for previous readme.

## TODOS

List of stuff that needs to be refactored, rewritten and segregated.

### CUSTOM PLUGINS

Parts which were once tightly integrated with this configuration. We
will take such parts and segregate them into custom plugins.

- ~~A theme engine.~~ ✅
- A statusline.

### PRECONFIGURED PLUGINS AND MIGRATION

Rather than configuring treesitter and lsp we will instead use plugins
that will preconfigure those for us. Following are the plugins that
are needed to keep an eye on.

- <https://github.com/nvim-lua/lsp-status.nvim>
- <https://github.com/nvim-lua/popup.nvim>
- <https://github.com/simrat39/rust-tools.nvim>
- <https://github.com/meznaric/conmenu>
- <https://github.com/lukas-reineke/lsp-format.nvim>
- <https://github.com/williamboman/mason.nvim>
- <https://github.com/anuvyklack/hydra.nvim>
- <https://github.com/SmiteshP/nvim-navic>
- <https://github.com/mfussenegger/nvim-jdtls>
- <https://github.com/mfussenegger/nvim-dap>
