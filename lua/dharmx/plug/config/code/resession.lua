local ok, resession = pcall(require, "resession")
if not ok then return end

resession.setup({
  autosave = {
    enabled = false,
    interval = 60,
    notify = true,
  },
  options = {
    "binary",
    "bufhidden",
    "buflisted",
    "cmdheight",
    "diff",
    "filetype",
    "modifiable",
    "previewwindow",
    "readonly",
    "scrollbind",
    "winfixheight",
    "winfixwidth",
  },
  buf_filter = resession.default_buf_filter,
  tab_buf_filter = function(tabpage, bufnr) return true end,
  dir = "session",
  load_detail = true,
  extensions = {
    quickfix = {},
  },
})

-- vim:filetype=lua
