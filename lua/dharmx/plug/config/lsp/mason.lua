local ok, mason = pcall(require, "mason")
if not ok then return end

mason.setup({
  max_concurrent_installers = 10,
  border = "solid",
  pip = { upgrade_pip = true },
  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = "◍ ",
    },
  },
})

-- vim:filetype=lua
