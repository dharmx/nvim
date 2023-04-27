local function req(file) require("dharmx.plug.config.core." .. file) end

return {
  {
    "folke/lazy.nvim",
  },
  {
    "dharmx/colo.nvim",
    dependencies = { "b0o/incline.nvim" },
    config = function() req("colo") end,
    branch = "dev",
    dev = true,
    lazy = false,
  },
}
