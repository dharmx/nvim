---@diagnostic disable: undefined-field
local J = require("plenary.job")
local Path = require("plenary.path")

local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local state = require("telescope.state")

local make_entry = require("telescope.make_entry")
local previewer = require("telescope.previewers.buffer_previewer")
local entry_display = require("telescope.pickers.entry_display")

local actions_layout = require("telescope.actions.layout")
local actions_state = require("telescope.actions.state")

local dialog = require("telescope.previewers.utils").set_preview_message

local HEAD = "<head>"
local NORM = "<norm>"
local LONE = "<lone>"
local MAIN = "<main>"

-- TODO: Implement recents.
local defaults = {
  separator = " ",
  gradle_icon = "",
  results_title = "",
  fill = "=",
  prompt_title = "Gradle Tasks",
  on_choice = function(entry) vim.cmd.terminal(entry.cmd) end,
  cache_filename = ".cached-tasks",
  previewer = false,
  layout_config = {
    preview_cutoff = 120,
    width = function(_, maximum_columns, _) return math.min(maximum_columns, 90) end,
    height = function(_, _, maximum_lines) return math.min(maximum_lines, 20) end,
  },
}

-- API Implementations {{{
local function gen_from_gradle_cmds(opts)
  local displayer = entry_display.create({
    separator = opts.separator,
    items = {
      { width = 1 },
      { width = 80 },
      { remaining = true },
    },
  })

  local function make_display(entry)
    local entries = {}
    if entry.value.type == HEAD then -- make this non-interactive
      table.insert(entries, { opts.gradle_icon, "@constant" })
      if entry.value.main then
        table.insert(entries, { entry.value.label, "@constant" })
      else
        table.insert(entries, { entry.value.label, "@include" })
      end
    elseif entry.value.type == NORM then
      table.insert(entries, " ")
      table.insert(entries, { entry.value.label, "@float" })
    elseif entry.value.type == LONE then
      table.insert(entries, " ")
      table.insert(entries, { entry.value.label, "@debug" })
    else
      table.insert(entries, " ")
      table.insert(entries, { entry.value.label, "@define" })
    end
    return displayer(entries)
  end

  return function(entry)
    local head = ""
    if entry.head then heading = entry.head .. ":" end
    return make_entry.set_default_entry_mt({
      value = entry,
      display = make_display,
      ordinal = head .. entry.type .. ":" .. entry.label,
    }, opts)
  end
end
-- }}}

local function parse_lines(lines, ignore_lines)
  local items = {}
  local will_break = false
  local head
  for index, line in ipairs(lines) do
    line = vim.trim(line)
    if not vim.tbl_contains(ignore_lines, index) and not line:match("^-+$") then
      local item = {}
      if line == "" then
        will_break = true
      elseif line:match("^%w") then
        if will_break then
          item.type = HEAD
          item.label = line
          item.about = line
          head = line
          will_break = false
        else
          local tokens = vim.split(line, " - ", { plain = true })
          if #tokens ~= 0 and #tokens > 1 then
            item.head = head
            item.type = tokens[1]:match("^%w+:") and NORM or LONE
            item.label = table.remove(tokens, 1)
            item.about = table.concat(tokens, " - ")
            item.cmd = "./gradlew " .. item.label
          else
            item.head = head
            item.type = tokens[1]:match("^%w+:") and LONE or MAIN
            item.label = table.remove(tokens, 1)
            item.about = "No description."
            item.cmd = "./gradlew " .. item.label
          end
        end
      end
      if item.type then table.insert(items, item) end
    end
  end
  items[1].main = true
  items[1].type = HEAD
  return items
end

local function get_tasks(on_success, title)
  ---@type Path
  local tasks_path = Path:new("./" .. title)
  if not tasks_path:exists() then
    tasks_path:touch({ exists_ok = true })
    tasks_path:write("{}", "w")
  end

  local cache_raw = tasks_path:read()
  local tasks_cache = {}
  if type(cache_raw) == "string" then
    tasks_cache = vim.json.decode(cache_raw)
    if tasks_cache then
      on_success(tasks_cache)
    else
      tasks_cache = {}
    end
  end

  -- Parser Job {{{
  J:new({
    command = "./gradlew",
    args = { "tasks", "--all" },
    on_exit = function(self, code, _)
      if code ~= 0 then return end
      local tasks = self:result()
      tasks = parse_lines(tasks, { 1, 2, 3, #tasks - 2, #tasks - 1, #tasks })

      local equal = #tasks == #tasks_cache
      if equal then -- deep array equal
        for index, item in ipairs(tasks) do
          local cache_item = tasks_cache[index]
          if cache_item and item.type == cache_item.type then
            if item.about ~= cache_item.about or item.label ~= cache_item.label then equal = true end
          end
        end
      end

      -- WARN: this will cause problems when implementing recents
      vim.schedule(function()
        if tasks_cache and equal then return end -- only refresh if the cache and new tasks aren't equal
        tasks_path:write(vim.json.encode(tasks), "w")
        on_success(tasks)
      end)
    end,
  }):start()
  -- }}}
end

return require("telescope").register_extension({
  exports = {
    gradle = function(opts)
      if not vim.loop.fs_realpath("./gradlew") then return end
      opts = vim.F.if_nil(opts, {})
      opts = vim.tbl_deep_extend("keep", opts, defaults)

      ---@type Picker
      local picker
      get_tasks(function(tasks)
        if picker then -- refreshed with updated values (if any)
          picker:refresh(finders.new_table({ results = tasks, entry_maker = gen_from_gradle_cmds(opts) }), opts)
          return
        end

        picker = pickers.new(opts, { -- currently viewing cached values
          finder = finders.new_table({ results = tasks, entry_maker = gen_from_gradle_cmds(opts) }),
          sorter = sorters.get_fzy_sorter(opts),
          previewer = previewer.new_buffer_previewer({
            define_preview = function(self, entry)
              local about = vim.F.if_nil(entry.value.about, "NOT APPLICABLE")
              dialog(self.state.bufnr, self.state.winid, about, opts.fill)
            end,
          }),
          attach_mappings = function(buffer, map)
            map("n", "<C-P>", actions_layout.toggle_preview)
            map("i", "<C-P>", actions_layout.toggle_preview)

            local function smart_move(move_type)
              return function(...)
                local entry = actions_state.get_selected_entry().value
                if entry.type ~= "<head>" then return end

                -- HACK: having all entries as <head>s will result in a infinite loop
                -- so we just get the current sorter state and see what was in the prompt
                -- and if the prompt matches a case where only heads are viewed then we
                -- do not move the current selection
                -- TODO: Is there a better way to do this?
                local move = true
                local sorter = state.get_status(...).picker.sorter
                if
                  sorter
                  and sorter._discard_state
                  and sorter._discard_state.prompt:len() > 3 -- hack case
                  and sorter._discard_state.prompt:match("^<hea") -- hack case
                then
                  move = false
                end
                if move then actions["move_selection_" .. move_type](...) end
              end
            end

            actions.move_selection_next:enhance({ post = smart_move("next") })
            actions.move_selection_previous:enhance({ post = smart_move("previous") })
            actions.select_default:replace(function()
              local entry = actions_state.get_selected_entry().value
              -- do not allow the users to use <head> entries
              if entry.type ~= "<head>" then
                actions.close(buffer)
                opts.on_choice(entry)
              end
            end)
            return true
          end,
        })
        picker:find()
      end, opts.cache_filename)
    end,
  },
})
