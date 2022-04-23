lua << EOF
theme.setup { scheme = "night" }
hi("Pmenu", { guibg = colors.shades.shade05, guifg = colors.common.base04, blend = 2 })
hi("WhichKeyFloat", { guibg = colors.shades.shade08 })
EOF

" vim:ft=vim
