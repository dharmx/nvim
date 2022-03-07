local present, spotify = pcall(require, "nvim-spotify")

if not present then
  return
end

local config = {
  status = {
    update_interval = 10000, -- the interval (ms) to check for what's currently playing
    format = "%s %t by %a", -- spotify-tui --format argument
  },
}

spotify.setup(config)
