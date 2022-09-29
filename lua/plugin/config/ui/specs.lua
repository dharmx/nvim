local present, specs = pcall(require, "specs")

specs.setup({
  show_jumps = true,
  min_jump = 17,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 13, -- time increments used for fade/resize effects
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 13,
    winhl = "StatusLineMode",
    fader = specs.pulse_fader,
    resizer = specs.shrink_resizer,
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
})
