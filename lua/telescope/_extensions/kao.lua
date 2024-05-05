local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config")

local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")
local actions_state = require("telescope.actions.state")

local curl = require("plenary.curl")
local P = require("plenary.path")
local db = P:new(vim.fn.stdpath("state") .. "/kao.db.json")
local results = nil

if not db:exists() then-- {{{
  curl.get("https://raw.githubusercontent.com/towzeur/Japanese-Emoticons-json/master/Japanese_Emoticons.json", {
    accept = "application/json",
    callback = function(response)
      local parsed = vim.json.decode(response.body)
      results = {}
      ---@diagnostic disable-next-line: param-type-mismatch
      for annotation, emojis in pairs(parsed) do
        for _, emoji in ipairs(emojis) do
          table.insert(results, { annotation = annotation, emoji = emoji })
        end
      end
      db:write(vim.json.encode(results), "w")
    end,
  })
end-- }}}

local function gen_from_kao(options)
  local displayer = entry_display.create({
    separator = " ",
    items = {
      { width = 20 },
      { remaining = true },
    },
  })

  return function(value)
    return make_entry.set_default_entry_mt({
      value = value,
      ordinal = value.annotation .. ":" .. value.emoji,
      display = function(entry)
        return displayer({
          { entry.value.annotation, "Question" },
          { entry.value.emoji, "@text" },
        })
      end,
    }, options)
  end
end

return require("telescope").register_extension({
  exports = {
    kao = function(options)
      options = vim.F.if_nil(options, {})
      options.previewer = false
      options.layout_strategy = vim.F.if_nil(options.layout_strategy, "cursor")
      options.layout_config = vim.F.if_nil(options.layout_config, {
        width = 0.3,
        height = 0.5,
        prompt_position = "top",
      })

      -- inspo: discord
      results = vim.F.if_nil(vim.json.decode(db:read()), results)
      if not results then return end
      options.prompt_prefix = vim.F.if_nil(options.prompt_prefix, (function()
        return results[math.random(1, #results)].emoji .. "  "
      end)())

      pickers.new(options, {
        finder = finders.new_table({ results = results, entry_maker = gen_from_kao(options) }),
        sorter = config.values.generic_sorter(options),
        attach_mappings = function(buffer)
          actions.select_default:replace(function()
            local current = actions_state.get_selected_entry()
            vim.schedule(function()
              vim.api.nvim_put({ current.value.emoji }, "c", false, true)
            end)
            actions.close(buffer)
          end)
          return true
        end,
      }):find()
    end,
  },
})
