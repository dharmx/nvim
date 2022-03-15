local present, nlsp = pcall(require, "nlspsettings")

if not present then
  return
end

local config = {
  config_home = stdpath "config" .. "/lua/configs/lsp/schemas",
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers = { ".git" },
  append_default_schemas = true,
  loader = "json",
}

nlsp.setup(config)
