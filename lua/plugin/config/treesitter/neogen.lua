local present, neogen = pcall(require, "neogen")

if not present then
  return
end

neogen.setup({
  snippet_engine = "luasnip",
  input_after_comment = true,
  enabled = true,
  languages = {
    lua = {
      template = {
        annotation_convention = "emmylua",
      },
    },
  },
})

-- vim:filetype=lua
