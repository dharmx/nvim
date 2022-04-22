local I = {}

function I.setup(options)
  colorscheme = options.scheme
  if fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  colors = theming.get_active_scheme()
  theming.apply(colors)
end

return I

-- vim:ft=lua
