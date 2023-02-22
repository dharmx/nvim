local M = {}

local F = vim.fn
local A = vim.api

function M.input(options, actions)
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

  local keyword = vim.opt.iskeyword - "_" - "-"
  vim.bo.iskeyword = table.concat(keyword:get(), ",")
  vim.schedule(function() A.nvim_command("stopinsert") end)

  -- TODO: Return the input object so that mappings can be defined separately.
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

function M.shorten()
  local format = [[!curl --silent "https://is.gd/create.php?format=simple&url=%s"]]

  M.input({
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
      local raw = vim.split(A.nvim_exec(string.format(format, value), true), "\n", { plain = true })
      if value == "Your URL..." then
        M.notify({
          message = "ERROR: Couldn't fetch the shortened URL!",
          icon = " ",
          title = "URL Shortner",
          level = vim.log.levels.ERROR,
        })
      else
        F.setreg(vim.v.register, raw[#raw])
        M.notify({
          message = "Saved link to system clipboard!",
          icon = " ",
          title = "URL Shortner",
        })
      end
    end,
  })
end

-- NOTE: Stolen from https://github.com/asrul10/readable-number.nvim.
function M.readable_numbers()
  local current = F.expand("<cword>")

  if tonumber(current) then
    if #current < 3 then return end
    local formatted = ""
    for i = #current, 1, -3 do
      if i - 3 <= 0 then
        formatted = current:sub(1, i) .. formatted
        break
      end
      formatted = "_" .. current:sub(i - 2, i) .. formatted
    end
    ---@diagnostic disable-next-line: param-type-mismatch
    A.nvim_set_current_line(F.substitute(F.getline("."), current, formatted, ""))
  end
end

return M
