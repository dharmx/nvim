local ok, mason = pcall(require, "mason")
if not ok then return end

mason.setup({
  pip = {
    upgrade_pip = true,
  },
  max_concurrent_installers = 5,
  border = "solid",
  ui = {
    icons = {
      package_installed = " ",
      package_pending = " ",
      package_uninstalled = "◍ ",
    },
  },
})

-- vim:filetype=lua
