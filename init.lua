vim.cmd.colorscheme("radium")
local core_path = vim.fn.stdpath("config") .. "/core"

for _, file in ipairs(vim.fn.readdir(core_path)) do
  vim.cmd.source(core_path .. "/" .. file)
end

for _, prov in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  vim.g["loaded_" .. prov .. "_provider"] = 0
end

require("dharmx.plugins").exclude_load()
require("scratch.ethos").setup()
vim.env.PATH = vim.env.PATH .. ":./node_modules/.bin"

require("nvim-treesitter.parsers").get_parser_configs().lube = {
  install_info = {
    url = vim.env.HOME .. "/Projects/neovim/tree-sitter-lube",
    files = { "src/parser.c" },
    branch = "main",
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = "lube",
}
