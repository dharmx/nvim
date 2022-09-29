local present, cmp_lsp = pcall(require, "cmp_nvim_lsp")

if not present then
  return
end

cmp_lsp.update_capabilities(require("utils.lsp").capabilities())

-- vim:ft=lua
