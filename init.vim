colorscheme radium
let settings = stdpath('config') . '/settings/*'
for file in glob(settings, 0, 1) | exe 'so ' . file | endfor
for prov in ['node', 'perl', 'python3', 'ruby'] | let g:['loaded_' . prov . '_provider'] = 0 | endfor
lua require("dharmx.plugins").exclude_and_load()
