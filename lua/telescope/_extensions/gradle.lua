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

-- TODO: Implement recents.
local defaults = {
  separator = " ",
  gradle_icon = "",
  results_title = "",
  fill = "=",
  prompt_title = "Gradle Tasks",
  on_choice = function(entry)
    vim.cmd.terminal(table.concat(entry.command, " "))
  end,
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
    if entry.value.category == "<head>" then -- make this non-interactive
      table.insert(entries, { opts.gradle_icon, "@constant" })
      table.insert(entries, { entry.value.task, "@constant" })
    elseif entry.value.category == "<main>" then
      table.insert(entries, " ")
      table.insert(entries, { entry.value.task, "@float" })
    elseif entry.value.category == "<none>" then
      table.insert(entries, " ")
      table.insert(entries, { entry.value.task, "@debug" })
    else
      table.insert(entries, " ")
      table.insert(entries, { entry.value.category .. ":" .. entry.value.task, "@define" })
    end
    return displayer(entries)
  end

  return function(entry)
    local heading = ""
    if entry.heading then heading = entry.heading .. ":" end
    return make_entry.set_default_entry_mt({
      value = entry,
      display = make_display,
      ordinal = heading .. entry.category .. ":" .. entry.task,
    }, opts)
  end
end
-- }}}

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
      local lines = self:result()
      -- rm unneeded lines
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines, 1)
      table.remove(lines)
      table.remove(lines)
      table.remove(lines)
      local joined = table.concat(lines, "\n")
      local sectioned = vim.split(joined, "\n\n")

      local function make_command(task, category)
        local command_list = { "./gradlew" }
        if not category then
          table.insert(command_list, task)
        else
          table.insert(command_list, category .. ":" .. task)
        end
        return command_list
      end

      local tasks = {}
      for _, section in ipairs(sectioned) do
        local cmds = vim.split(section, "\n", { plain = true })
        local heading = table.remove(cmds, 1)
        table.insert(tasks, { task = heading, category = "<head>" })
        table.remove(cmds, 1) -- rm cosmetic dash-underline sep

        for _, cmd in ipairs(cmds) do
          local trimmed = vim.trim(cmd)
          local found, _, category, task, description = string.find(trimmed, "^(%w+):(%w+) - (.*)$")
          if description then description = description:sub(3, #description) end

          -- Parse line {{{
          local entry = {}
          if found then
            entry.command = make_command(task, category)
            entry.category = category
            entry.description = description
            entry.task = task
            entry.heading = heading
          else
            found, _, category, task = string.find(trimmed, "^(%w+):(%w+)$")
            if found then
              entry.command = make_command(task, category)
              entry.category = category
              entry.description = "No description."
              entry.task = task
              entry.heading = heading
            else
              found, _, task, description = string.find(trimmed, "^(%w+) - (.*)$")
              if found then
                entry.command = make_command(task)
                entry.category = "<main>"
                entry.description = description:sub(3, #description)
                entry.task = task
                entry.heading = heading
              else
                found, _, task = string.find(trimmed, "^(%w+)$")
                if found then
                  entry.task = task
                  entry.category = "<none>"
                  entry.description = "No description."
                  entry.heading = heading
                end
              end
            end
          end
          -- }}}
          if not vim.tbl_isempty(entry) then table.insert(tasks, entry) end
        end
      end

      local equal = #tasks == #tasks_cache
      if equal then -- deep array equal
        for index, item in ipairs(tasks) do
          local cache_item = tasks_cache[index]
          if cache_item and item.category == cache_item.category then
            if item.description ~= cache_item.description or item.task ~= cache_item.task then equal = true end
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
              local description = vim.F.if_nil(entry.value.description, "NOT APPLICABLE")
              dialog(self.state.bufnr, self.state.winid, description, opts.fill)
            end,
          }),
          attach_mappings = function(buffer, map)
            map("n", "<C-P>", actions_layout.toggle_preview)
            map("i", "<C-P>", actions_layout.toggle_preview)

            local function smart_move(move_type)
              return function(...)
                local entry = actions_state.get_selected_entry().value
                if entry.category ~= "<head>" then return end

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
              if entry.category ~= "<head>" then
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
