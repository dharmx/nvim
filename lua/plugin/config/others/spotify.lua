local present, spotify = pcall(require, "nvim-spotify")

if not present then
  return
end

local api = vim.api

local config = {
  status = {
    update_interval = 10000, -- the interval (ms) to check for what's currently playing
    format = "%s %t by %a", -- spotify-tui --format argument
  },
}

if api.nvim_exec("silent !pidof spotifyd", false) == "" then
  api.nvim_exec("silent !spotifyd", false)
  notify({
    message = "Spotify daemon is now running...",
    title = "spotifyd",
    icon = "",
  })
end

spotify.setup(config)

-- vim:ft=lua
