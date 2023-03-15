local old = vim.keymap.set
_G._meta = {}

vim.keymap.set = function(modes, key, action, options)
  if type(modes) == "string" then modes = { modes } end
  for _, mode in ipairs(modes) do
    _G._meta[mode] = vim.F.if_nil(_G._meta[mode], {})
    _G._meta[mode][key] = {}
    _G._meta[mode][key].action = action
    for option, value in pairs(vim.F.if_nil(options, {})) do _G._meta[mode][key][option] = value end
    old(mode, key, action, options)
  end
end
