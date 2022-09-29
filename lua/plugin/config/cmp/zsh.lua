local present, zsh = pcall(require, "cmp_zsh")

if not present then
  return
end

zsh.setup({
  zshrc = true,
  filetypes = { "zsh" },
})

-- vim:ft=lua
