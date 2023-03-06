local cmd = vim.api.nvim_create_user_command
local parson = require("scratch.parson")
local db = parson._database
parson.setup()

db = db
  + { "akinsho/bufferline.nvim" }
  + { "goolord/alpha-nvim" }
  + { "AndrewRadev/linediff.vim", lazy = true }
  + { "tpope/vim-repeat", lazy = true }
  + { "stevearc/aerial.nvim", config = function() require("dharmx.plug.config.code.aerial") end }
  + { "sindrets/diffview.nvim", config = function() require("dharmx.plug.config.code.diffview") end }
  + { "doums/monark.nvim", config = function() require("dharmx.plug.config.ui.monark") end, lazy = true }

local function on(events)
  return function(plugin)
    vim.api.nvim_create_autocmd(events, {
      callback = plugin.load,
      once = true,
      desc = string.format("Load %s on %s", plugin.repo, vim.inspect(events)),
    })
  end
end

local lazy = {
  ["linediff.vim"] = on("CmdlineEnter"),
  ["vim-repeat"] = on("CursorHold"),
  ["monark.nvim"] = on({ "CursorMoved", "CursorHold", "InsertEnter" }),
}

for name, plugin in pairs(db) do
  if not plugin.installed then
    plugin.download()
  elseif lazy[name] and plugin.lazy then lazy[name](plugin) end
end

cmd("Parson", function(args)
  if vim.tbl_contains({ "update", "download", "load" }, args.args) then
    for _, plugin in pairs(db) do plugin[args.args]() end
  else vim.pretty_print(db) end
end, {
  nargs = "?",
  complete = function() return { "update", "download", "list", "load" } end,
  desc = "Plugin manager commands.",
})
