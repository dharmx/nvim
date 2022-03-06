local present, saga = pcall(require, "lspsaga")

if not present then
  return
end

local maps = require("mappings").lspsaga_nvim

local config = {
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_ico = "  ",
  max_preview_lines = 10,
  finder_action_keys = maps.finder_action_keys,
  code_action_keys = maps.code_action_keys,
  rename_action_keys = maps.rename_action_keys,
  definition_preview_icon = "  ",
  border_style = "round",
  rename_prompt_prefix = "➤",
}

saga.init_lsp_saga()
