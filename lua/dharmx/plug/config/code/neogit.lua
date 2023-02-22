local present, neogit = pcall(require, "neogit")
if not present then return end

neogit.setup({
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
})
