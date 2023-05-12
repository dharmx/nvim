local ok, wilder = pcall(require, "wilder")
if not ok then return end

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("pipeline", {
  wilder.branch(
    wilder.cmdline_pipeline({ fuzzy = 0, set_pcre2_pattern = 1 }),
    wilder.search_pipeline({
      pattern = wilder.python_fuzzy_pattern(),
      sorter = wilder.python_difflib_sorter(),
      engine = "re",
    })
  ),
})

wilder.set_option(
  "renderer",
  wilder.wildmenu_renderer({
    highlighter = wilder.basic_highlighter(),
  })
)
