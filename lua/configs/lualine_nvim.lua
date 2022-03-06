    {
      "filename",
      file_status = true,
      path = 0,
      shorting_target = 20,
      symbols = {
        modified = " ",
        readonly = " ",
        unnamed = " Unnamed",
      },
    },
    { gps.get_location, cond = gps.is_available },
  },
  lualine_x = {
    {
      "encoding",
      fmt = function()
        return vim.opt.fileencoding:get():upper()
      end,
    },
    { "fileformat", symbols = { unix = "", dos = "", mac = "" } },
    "filetype",
  },
  lualine_y = {
    {
      "progress",
      fmt = function()
        local current_line = vim.fn.line "."
        local total_lines = vim.fn.line "$"
        local chars = {
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
          " ",
        }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index] .. "" .. math.ceil(line_ratio * 100)
      end,
      separator = { left = "", right = "" },
      padding = { left = 1, right = 1 },
    },
  },
  lualine_z = {
    {
      "location",
      fmt = function()
        return "煮"
      end,
      padding = { left = 0, right = 0 },
    },
  },
}

