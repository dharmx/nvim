--- Wraps frequently used neovim API functions. And passes some default options
--- to decrease the code.

local M = {}

local fn = vim.fn
local api = vim.api
local cmd = api.nvim_command

--- Check whether the current buffer is empty.
-- @see help empty()
-- @see help expand()
function M.is_buffer_empty()
  return fn.empty(fn.expand("%:t")) == 1
end

--- Check if the windows width is greater than a given number of columns.
-- @param cols number of columns
-- @see help winwidth()
function M.has_width_gt(cols)
  return fn.winwidth(0) / 2 > cols
end

--- Wraps around vim.notify. Sets some default values that will be used by the
--- nvim-notify notification replacement plugin.
-- @param options takes in notification category, title, icon, etc.
-- @see help vim.notify for more info.
function M.notify(options)
  -- if only a string is passed then show a generic notification.
  if type(options) == "string" then
    api.nvim_notify(options, vim.log.levels.INFO, {
      icon = "",
      title = "Notification",
    })
    return
  end

  -- default configuration
  local forced = vim.tbl_extend("force", {
    message = "This is a sample notification.",
    icon = "",
    title = "Notification",
    level = vim.log.levels.INFO,
  }, options or {}) -- don't let the table be nil
  api.nvim_notify(forced.message, forced.level, {
    title = forced.title,
    icon = forced.icon,
  })
end

--- A cnoreabbrev wrapper.
-- @param buffer the buffer number that it applies to
-- @param command the command that will be executed on trigger
-- @param expression the pattern that will trigger the abbrev
-- @see help cnoreabbrev
function M.abbrev(buffer, command, expression)
  local formatted = string.format("cnoreabbrev %s %s %s", expression and "<expr>" or "", buffer, command)
  cmd(formatted)
end

--- Aliases an already existing command or, creates a new user command
--- or, overwrites the existing command.
-- @param alias the name of the new user command.
-- @param command the callback or a string containing a command
-- that will be triggered on running that alias on cmdline (say)
-- @param options table of other options that will be passed over to
-- nvim_add_user_command
-- @see help nvim_add_user_command
function M.alias(alias, command, options)
  options = options or {}
  api.nvim_create_user_command(alias, command, options)
end

function M.unalias(command)
  api.nvim_del_user_command(command)
end

--- Same as M.alias but, for buffers
-- @see M.alias
function M.buf_alias(buffer, alias, command, options)
  options = options or {}
  api.nvim_buf_create_user_command(buffer, alias, command, options)
end

--- The wrapper for nvim_create_autocmd API function.
-- @param events a string or a table of vim events.
-- @param command a Lua function or, a string containing VimL code.
-- @param options table of other options it is not compulsory FYI
-- @return opaque value to use with nvim_del_autocmd
-- @see help nvim_create_autocmd
function M.autocmd(events, command, options)
  if not options then
    options = {}
  end
  local autocmd_opts = {}

  autocmd_opts[type(command) == "string" and "command" or "callback"] = command
  if not options.buffer then
    autocmd_opts.pattern = not options.patterns and "*" or options.patterns
  else
    autocmd_opts.buffer = options.buffer or options.bufnr
  end

  if options.group then
    autocmd_opts.group = options.group
  end

  api.nvim_create_autocmd(events, autocmd_opts)
  -- pass the group name if more autocmds are needed to be added to this group
  return options.group
end

--- Wrapper for nvim_create_augroup.
-- @param name title of the auto group
-- @param autocmds a table of tables that contains the same structure as M.autocmd.
-- @field autocmds.events refer to M.autocmd
-- @field autocmds.command refer to M.autocmd
-- @tparam autocmds.options refer to M.autocmd
-- @tparam clear boolean option if the auto-group will be repeated if it is
-- called again. Will be cleared if set to true.
-- @return same as M.autocmd
function M.augroup(name, autocmds, clear)
  clear = clear == false and false or true
  local append = M.autocmd
  local group = api.nvim_create_augroup(name, { clear = clear })
  for _, autocmd in ipairs(autocmds) do
    if not autocmd.options then
      autocmd.options = {}
    end
    autocmd.options.group = group
    append(autocmd.events, autocmd.command, autocmd.options)
  end
  return group
end

--- Checks if a treesitter parser is available for the current file.
--- If not then prompts to install the parser(s).
-- @see Adapted from https://is.gd/rETGe2
function M.ensure_treesitter_language_installed()
  local parsers = require("nvim-treesitter.parsers")
  local lang = parsers.get_buf_lang()
  if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
    vim.schedule(function()
      vim.ui.select({
        "Sure, I don't mind.",
        "Nope, fuck yourself!",
      }, {
        prompt = "Install tree-sitter parsers for " .. lang .. "?",
      }, function(item)
        if item == "Sure, I don't mind." then
          cmd("TSInstall " .. lang)
        end
      end)
    end)
  end
end

--- Creates a make-shift float buffer.
-- NOTE: Relies on nui.nvim
-- @param options table popup options
-- @param actions table popup functions
-- @tparam actions.on_submit executes after <CR> is pressed
-- @tparam actions.on_change executes if any character is typed on the buffer
-- @tparam actions.on_close executes after the buffer is closed
-- @tparam actions.prompt input prefix
-- @tparam options.default_value placeholder text
-- @tparam options.position table row and col value
-- @tparam options.border border style
-- @tparam options.size width and height of the buffer
-- @tparam options.highlight highlight groups for borders and the buffer itself
function M.make_input(options, actions)
  local Input = require("nui.input")
  local autocmd = require("nui.utils.autocmd")
  local event = autocmd.event

  options = options or {}
  actions = actions or {}

  local popup_options = {
    position = options.position or {
      row = 5,
      col = 5,
    },
    highlight = options.highlight or "TabLine:FloatBorder",
    size = options.size or 50,
    border = options.border or {
      style = "solid",
    },
  }

  local input = Input(popup_options, {
    prompt = actions.prompt or " > ",
    default_value = actions.default_value or "Enter a value!",
    on_submit = actions.on_submit,
    on_close = actions.on_close,
    on_change = actions.on_change,
  })
  input:mount()

  local kw = vim.opt.iskeyword - "_" - "-"
  vim.bo.iskeyword = table.concat(kw:get(), ",")
  vim.schedule(function()
    vim.api.nvim_command("stopinsert")
  end)

  -- TODO: Return the input object so that mappings can be defined separately.
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

--- URL shortner
-- this depends on nui.nvim
function M.shorten()
  local format = [[!curl --silent "https://is.gd/create.php?format=simple&url=%s"]]

  M.make_input({
    position = {
      row = 5,
      col = 5,
    },
    size = 50,
    border = {
      style = "solid",
    },
  }, {
    prompt = "   ",
    default_value = "Your URL...",
    on_submit = function(value)
      local raw = vim.split(api.nvim_exec(string.format(format, value), true), "\n")
      if value == "Your URL..." then
        M.notify({
          message = "ERROR: Couldn't fetch the shortened URL!",
          icon = " ",
          title = "URL Shortner",
          level = vim.log.levels.ERROR,
        })
      else
        fn.setreg(vim.v.register, raw[#raw])
        M.notify({
          message = "Saved link to system clipboard!",
          icon = " ",
          title = "URL Shortner",
        })
      end
    end,
  })
end

--- Upload an image to imgur via url.
-- depends on nui.nvim
function M.imgur()
  local format = [[!imgur-upload "%s" | xclip]]

  M.make_input({
    position = {
      row = 5,
      col = 5,
    },
    size = 50,
    border = {
      style = "solid",
    },
  }, {
    prompt = "   ",
    default_value = "Image path...",
    on_submit = function(value)
      local raw = api.nvim_exec(string.format(format, fn.expand(value)), true)
      if value == "Your URL..." then
        M.notify({
          message = "ERROR: Unable to upload image!",
          icon = " ",
          title = "Imgur",
          level = vim.log.levels.ERROR,
        })
      else
        M.notify({
          message = "Saved link to system clipboard!",
          icon = " ",
          title = "Imgur",
        })
      end
    end,
  })
end

--- Wrote this as plenary is not available during init.
-- @param module_path string directory path
function M.scan_dir(module_path)
  local command = io.popen(string.format("find %s -type f", fn.stdpath("config") .. module_path))
  local hl_path = vim.split(command:read("*a"), "\n")
  table.remove(hl_path, #hl_path)
  command:close()
  return hl_path
end

function M.reload_module(module_name, starts_with_only)
  -- Default to starts with only
  if starts_with_only == nil then
    starts_with_only = true
  end

  -- TODO: Might need to handle cpath / compiled lua packages? Not sure.
  local matcher
  if not starts_with_only then
    matcher = function(pack)
      return string.find(pack, module_name, 1, true)
    end
  else
    local module_name_pattern = vim.pesc(module_name)
    matcher = function(pack)
      return string.find(pack, "^" .. module_name_pattern)
    end
  end

  -- Handle impatient.nvim automatically.
  local luacache = (_G.__luacache or {}).cache

  for pack, _ in pairs(package.loaded) do
    if matcher(pack) then
      package.loaded[pack] = nil

      if luacache then
        luacache[pack] = nil
      end
    end
  end
end

return M

-- vim:ft=lua
