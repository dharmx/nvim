local settings = {
  "autocmds",
  "miscmds",
  "commands",
  "globals",
  "options",
  "disabled",
  "highlights",
}

for _, setting in ipairs(settings) do
  require("settings." .. setting)
end
