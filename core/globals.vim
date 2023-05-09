let g:mapleader = ';'
let g:python3_host_prog = 'python3'

if exists('g:neovide') == 0 | finish | endif
set guifont=Iosevka\ Nerd\ Font,Cooper\ Hewitt:h13
set linespace=8

let g:neovide_refresh_rate = 60
let g:neovide_transparency = 1.0

let g:neovide_no_idle = 1
let g:neovide_profiler = 0
let g:neovide_touch_deadzone = 6.0
let g:neovide_input_use_logo = 1
let g:neovide_remember_window_size = 1
let g:neovide_touch_drag_timeout = 0.17

let g:neovide_cursor_animation_length = 0.13
let g:neovide_cursor_trail_length = 0.8
let g:neovide_cursor_antialiasing = 1
let g:neovide_cursor_unfocused_outline_width = 0.125

let g:neovide_cursor_vfx_mode = 'railgun'
let g:neovide_cursor_vfx_opacity = 200.0
let g:neovide_cursor_vfx_particle_lifetime = 1.2
let g:neovide_cursor_vfx_particle_density = 7.0
let g:neovide_cursor_vfx_particle_speed = 10.0
let g:neovide_cursor_vfx_particle_phase = 1.5
let g:neovide_cursor_vfx_particle_curl = 1.0

let g:neovide_padding_top = 10
let g:neovide_padding_left = 10
let g:neovide_padding_right = 10
let g:neovide_padding_bottom = 10
