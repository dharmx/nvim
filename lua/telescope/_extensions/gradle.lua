local J = require("plenary.job")
local Path = require("plenary.path")

local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")

local actions_layout = require("telescope.actions.layout")
local previewer = require("telescope.previewers.buffer_previewer")
local state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")
local make_entry = require("telescope.make_entry")

local dialog = require("telescope.previewers.utils").set_preview_message

local defaults = {
  separator = " ",
  gradle_icon = "",
  layout_strategy = "cursor",
  results_title = "",
  fill = "=",
  prompt_title = "Gradle Tasks",
  on_choice = function(entry)
    if not entry.value.command then return end
    vim.cmd.terminal(table.concat(entry.value.command, " "))
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
    return make_entry.set_default_entry_mt({
      value = entry,
      display = make_display,
      ordinal = entry.category .. ":" .. entry.task,
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
        table.insert(tasks, { task = table.remove(cmds, 1), category = "<head>" })
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
          else
            found, _, category, task = string.find(trimmed, "^(%w+):(%w+)$")
            if found then
              entry.command = make_command(task, category)
              entry.category = category
              entry.description = "No description."
              entry.task = task
            else
              found, _, task, description = string.find(trimmed, "^(%w+) - (.*)$")
              if found then
                entry.command = make_command(task)
                entry.category = "<main>"
                entry.description = description:sub(3, #description)
                entry.task = task
              else
                found, _, task = string.find(trimmed, "^(%w+)$")
                if found then
                  entry.task = task
                  entry.category = "<none>"
                  entry.description = "No description."
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
              dialog(self.state.bufnr, self.state.winid, entry.value.description or "NOT APPLICABLE", opts.fill)
            end,
          }),
          attach_mappings = function(buffer, map)
            map("n", "<C-P>", actions_layout.toggle_preview)
            map("i", "<C-P>", function(...)
              actions_layout.toggle_preview(...)
            end)
            actions.select_default:replace(function()
              actions.close(buffer)
              local entry = state.get_selected_entry()
              opts.on_choice(entry)
            end)
            return true
          end,
        })
        picker:find()
      end, opts.cache_filename)
    end,
  },
})
