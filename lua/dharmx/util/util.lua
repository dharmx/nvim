local M = {}

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
  vim.schedule(function() vim.api.nvim_command("stopinsert") end)

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

return M

-- vim:filetype=lua
