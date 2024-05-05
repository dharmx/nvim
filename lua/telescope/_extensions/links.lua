local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local values = require("telescope.config").values

local NewPreview = require("telescope.previewers.buffer_previewer").new_buffer_previewer
local Uz = require("telescope._extensions.media.lib.ueberzug")

local db = vim.fs.normalize("~/Scratch/.links")
local cache = vim.fn.stdpath("cache") .. "/links/"
local cov = vim.fn.stdpath("config") .. "/scripts/cov"
vim.fn.mkdir(cache, "p")

local function preview_geo(window)
  if not vim.api.nvim_win_is_valid(window) then return end
  local rows = vim.go.lines - vim.go.cmdheight
  if vim.go.laststatus ~= 0 then rows = rows - 1 end

  local width = vim.api.nvim_win_get_width(window)
  local height = vim.api.nvim_win_get_height(window)

  local geo = {}
  geo.x = vim.go.columns - width
  geo.y = rows - height
  geo.w = width
  geo.h = height
  return geo
end

local function fetch(link, hooks)
  local code = link:match("https://nhentai%.net/g/(%d+)/?")
  if not code then return hooks.no_match() end
  vim.system({ cov, link, cache .. code }, { text = true }, hooks.on_match)
end

return require("telescope").register_extension({
  exports = {
    links = function(opts)
      opts = vim.F.if_nil(opts, {})
      local handle = io.open(db, "r")
      if not handle then return end

      local links = {}
      for line in handle:lines() do
        line = vim.trim(line)
        if line ~= "" then table.insert(links, line) end
      end
      handle:close()

      opts.uz = Uz:new(os.tmpname())
      opts.uz:listen()
      pickers.new(opts, {
        prompt_title = "Links",
        previewer = NewPreview({
          define_preview = function(_, entry, status)
            fetch(entry[1], {
              on_match = vim.schedule_wrap(function(o)
                local geo = preview_geo(status.preview_win)
                if not opts.uz then return end
                opts.uz:send({
                  path = vim.trim(o.stdout),
                  x = geo.x - 13, y = geo.y - 4,
                  width = geo.w, height = geo.h,
                })
              end),
              no_match = function() opts.uz:hide() end,
            })
          end,
          teardown = function()
            if not opts.uz then return end
            opts.uz:kill()
            opts.uz = nil
          end,
        }),
        sorter = values.generic_sorter(opts),
        finder = finders.new_table(links),
      }):find()
    end,
  },
})
