local present, lsp_signature = pcall(require, "lsp_signature")

if not present then
  return
end

local config = {
  debug = false,
  log_path = vim.fn.stdpath "cache" .. "/lsp_signature.log",
  verbose = false,
  bind = true,
  doc_lines = 20,
  floating_window = true,
  floating_window_above_cur_line = true,
  floating_window_off_x = 1,
  floating_window_off_y = 1,
  fix_pos = false,
  hint_enable = true,
  hint_prefix = "🐼 ",
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter",
  max_height = 12,
  max_width = 80,
  handler_opts = { border = "single" },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = " ",
  transparency = 2,
  shadow_blend = 36,
  shadow_guibg = "Black",
  timer_interval = 200,
  toggle_key = "<F4>",
}

lsp_signature.setup(config)
