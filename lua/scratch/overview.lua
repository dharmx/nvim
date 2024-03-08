---@diagnostic disable: need-check-nil
local M = {}
local A = vim.api

M._line = -1
M._structure = {}
M._util_names = {
  g = "gap",
  c = "center",
  h = "heading",
  e = "entry",
  s = "space",
  t = "titled",
}

M.config = {
  title = {
    "╔═══╗╔╗  ╔╗╔═══╗╔═══╗╔╗  ╔╗╔══╗╔═══╗╔╗╔╗╔╗",
    "║╔═╗║║╚╗╔╝║║╔══╝║╔═╗║║╚╗╔╝║╚╣╠╝║╔══╝║║║║║║",
    "║║ ║║╚╗║║╔╝║╚══╗║╚═╝║╚╗║║╔╝ ║║ ║╚══╗║║║║║║",
    "║║ ║║ ║╚╝║ ║╔══╝║╔╗╔╝ ║╚╝║  ║║ ║╔══╝║╚╝╚╝║",
    "║╚═╝║ ╚╗╔╝ ║╚══╗║║║╚╗ ╚╗╔╝ ╔╣╠╗║╚══╗╚╗╔╗╔╝",
    "╚═══╝  ╚╝  ╚═══╝╚╝╚═╝  ╚╝  ╚══╝╚═══╝ ╚╝╚╝ ",
  },
  winhl = "NormalFloat:Normal",
  section = {
    width = 100,
  },
}

-- Main Utils {{{
function M.setup(options)
  if M._loaded then return end
  options = vim.F.if_nil(options, {})
  M.config = vim.tbl_deep_extend("keep", options, M.config)
  M._loaded = true
end

function M.create()
  if not M._loaded then return end
  local namespace = A.nvim_create_namespace("Help")
  local buffer = A.nvim_create_buf(false, true)
  local window = A.nvim_open_win(buffer, true, {
    relative = "editor",
    row = 0,
    col = 0,
    width = vim.o.columns,
    height = vim.o.lines,
    style = "minimal",
    noautocmd = true,
  })

  A.nvim_win_set_buf(window, buffer)
  A.nvim_buf_set_name(buffer, "HELP")
  A.nvim_win_set_option(window, "winhl", M.config.winhl)
  A.nvim_buf_set_option(buffer, "modifiable", false)
  A.nvim_set_current_buf(buffer)

  local info = {
    namespace = namespace,
    window = window,
    buffer = buffer,
    lock = function() A.nvim_buf_set_option(buffer, "modifiable", false) end,
    unlock = function() A.nvim_buf_set_option(buffer, "modifiable", true) end,
    unmodify = function() A.nvim_buf_set_option(buffer, "modified", false) end,
  }

  vim.keymap.set("n", "q", function() M.delete(info) end, { buffer = buffer, desc = "quit overview" })
  return info
end

function M.delete(info)
  A.nvim_win_close(info.window, true)
  A.nvim_buf_delete(info.buffer, { force = true })
  M._structure = {}
  M._line = -1
  M._info = nil
end

function M.line()
  M._line = M._line + 1
  return M._line
end
-- }}}

-- Styling Utils {{{
function M.center(info, line, group)
  local width = A.nvim_strwidth(line)
  local columns = A.nvim_win_get_width(info.window)
  local column_start = (columns - width) / 2
  return {
    content = string.rep(" ", column_start) .. line,
    column = {
      start = column_start,
      finish = column_start + line:len()
    },
    type = "center",
    group = group,
  }
end

function M.gap()
  return {
    content = "",
    column = {
      start = 0,
      finish = 0
    },
    type = "gap",
  }
end

function M.space(info, group)
  local line = string.rep(" ", M.config.section.width)
  local width = A.nvim_strwidth(line)
  local columns = A.nvim_win_get_width(info.window)
  local column_start = (columns - width) / 2
  return {
    content = line .. string.rep(" ", column_start),
    column = {
      start = column_start,
      finish = column_start + line:len()
    },
    type = "space",
    group = group,
  }
end

function M.heading(info, line, groups)
  local width = A.nvim_strwidth(line)
  local column_start = (M.config.section.width - width) / 2
  local section = string.rep(" ", column_start) .. line .. string.rep(" ", column_start)
  local underflow = M.config.section.width - A.nvim_strwidth(section)
  if underflow > 0 then section = section .. string.rep(" ", underflow) end
  local centered = M.center(info, section)
  centered.type = "heading"
  centered.groups = { centered = groups.centered, titled = groups.titled }
  centered.column.titled = {
    start = column_start + centered.column.start - (underflow > 0 and underflow or 0),
    finish = column_start + centered.column.start + line:len() - (underflow > 0 and underflow or 0),
  }
  return centered
end

function M.titled(info, line, padding, groups)
  local heading = M.heading(info, M.KEY(line, padding), groups)
  heading.type = "titled"
  return heading
end

function M.entry(info, key, value, padding, groups)
  key = string.rep(" ", padding.left) .. key
  value = value .. string.rep(" ", padding.right)
  local key_width = A.nvim_strwidth(key)
  local value_width = A.nvim_strwidth(value)
  local spacing = M.config.section.width - key_width - value_width
  local content = key .. string.rep(" ", spacing) .. value
  local centered = M.center(info, content)
  return {
    content = centered.content,
    column = {
      start = centered.column.start, finish = centered.column.finish,
      key = { start = centered.column.start + padding.left, finish = centered.column.start + key_width },
      value = { start = centered.column.finish - value_width + padding.right, finish = centered.column.finish - padding.right },
    },
    groups = groups,
    type = "entry",
  }
end
-- }}}

-- Abstractions/Helpers {{{
function M.KEY(line, padding)
  return string.rep(" ", padding.left) .. line .. string.rep(" ", padding.right)
end

function M.PUT(util_name, ...)
  if type(util_name) == "number" then
    local index = 0
    while index < util_name do
      M.PUT()
      index = index + 1
    end
    return
  end

  if util_name and not M._util_names[util_name] then return end
  if not util_name then
    table.insert(M._structure, M.gap())
    return
  end
  table.insert(M._structure, M[M._util_names[util_name]](...))
end
-- }}}

function M.draw(info)
  info.unlock()
  local line = nil
  for _, item in ipairs(M._structure) do
    line = M.line()
    A.nvim_buf_set_lines(info.buffer, line, -1, true, { item.content })
    if item.type == "entry" then
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.groups.background, line, math.ceil(item.column.start), math.ceil(item.column.finish))
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.groups.key, line, math.ceil(item.column.key.start), math.ceil(item.column.key.finish))
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.groups.value, line, math.ceil(item.column.value.start), math.ceil(item.column.value.finish))
    elseif item.type == "heading" or item.type == "titled" then
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.groups.centered, line, math.ceil(item.column.start), math.ceil(item.column.finish))
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.groups.titled, line, math.ceil(item.column.titled.start), math.ceil(item.column.titled.finish))
    elseif item.type ~= "gap" then
      A.nvim_buf_add_highlight(info.buffer, info.namespace, item.group, line, math.ceil(item.column.start), math.ceil(item.column.finish))
    end
  end
  info.lock()
  info.unmodify()
end

-- Toggle {{{
function M.toggle()
  if not M._loaded then return end
  if M._info then
    M.delete(M._info)
    return
  end

  local info = M.create()
  -- layout/placements
  M.PUT(3)
  for _, line in ipairs(M.config.title) do M.PUT("c", info, line, "Function") end
  M.PUT(3)
  local modes = { n = "Normal", i = "Insert", v = "Visual", x = "Ex", c = "Command" }
  for mode, label in pairs(modes) do
    M.PUT("t", info, label .. "-Mode Defaults", { left = 1, right = 1 }, { centered = "CursorLine", titled = "TodoBgBUG" })
    M.PUT("s", info, "CursorLine")
    for _, keymap in ipairs(A.nvim_get_keymap(mode)) do
      keymap.desc = vim.F.if_nil(keymap.desc, "no description")
      M.PUT("e", info, (keymap.lhs:gsub(" ", "<space>")), keymap.desc, { left = 2, right = 2 }, { key = "Directory", value = "MsgArea", background = "CursorLine" })
    end
    M.PUT("s", info, "CursorLine")
    M.PUT()
  end
  M.draw(info)
  M._info = info
end
-- }}}

return M
