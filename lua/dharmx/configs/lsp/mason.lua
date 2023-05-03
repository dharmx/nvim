local ok, mason = pcall(require, "mason")
if not ok then return end

mason.setup({
  install_root_dir = vim.fn.stdpath("data") .. "/servers",
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
