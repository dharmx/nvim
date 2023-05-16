colorscheme radium
for file in glob(stdpath('config') . '/core/*', 0, 1) | execute 'so ' . file | endfor
for prov in ['node', 'perl', 'python3', 'ruby'] | let g:['loaded_' . prov . '_provider'] = 0 | endfor
lua require'dharmx.plugins'.exclude_load()
