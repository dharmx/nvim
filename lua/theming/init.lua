local I = {}

function I.setup(options)
  colorscheme = options.scheme
  if fn.exists "syntax_on" then
    cmd "syntax reset"
  end
  theming.apply(options)
  colors = theming.get_active_scheme()
end

return I

-- vim:ft=lua
