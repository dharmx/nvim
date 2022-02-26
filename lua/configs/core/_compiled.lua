-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/maker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/maker/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/maker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/maker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/maker/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "cmp_luasnip", "telescope-luasnip.nvim" },
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31configs.completion.luasnip\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cheatsheet.nvim"] = {
    commands = { "Cheatsheet", "CheatsheetEdit" },
    config = { "\27LJ\2\nå\1\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0'\2\4\0B\0\2\1K\0\1\0\15cheatsheet\19load_extension\14telescope5configs.workflow.telescope.extensions.cheatsheet\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-path" },
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history",
    wants = { "nvim-cmp" }
  },
  ["cmp-dictionary"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.vim" },
    config = { "\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"configs.completion.dictionary\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-fish"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-fish/after/plugin/cmp_fish.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-fish",
    url = "https://github.com/mtoohey31/cmp-fish",
    wants = { "nvim-cmp" }
  },
  ["cmp-git"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.completion.git\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-git",
    url = "https://github.com/petertriho/cmp-git",
    wants = { "plenary.nvim" }
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols",
    wants = { "nvim-cmp" }
  },
  ["cmp-look"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-look/after/plugin/cmp_look.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-npm"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm",
    wants = { "plenary.nvim", "nvim-cmp" }
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-buffer" },
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua",
    wants = { "nvim-cmp" }
  },
  ["cmp-nvim-tags"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags/after/plugin/cmp_nvim_tags.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags",
    wants = { "nvim-cmp" }
  },
  ["cmp-omni"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-omni/after/plugin/cmp_omni.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tmux"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-tmux/after/plugin/cmp_tmux.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux",
    wants = { "nvim-cmp" }
  },
  ["cmp-under-comparator"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  ["cmp-zsh"] = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-zsh/after/plugin/cmp_zsh.lua" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.completion.zsh\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp-zsh",
    url = "https://github.com/tamago324/cmp-zsh"
  },
  cmp_luasnip = {
    after_files = { "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["gitsigns.nvim"] = {
    commands = { "Gitsigns" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29configs.editing.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit",
    wants = { "plenary.nvim" }
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!configs.completion.autopairs\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-zsh", "cmp-dictionary", "LuaSnip", "nvim-autopairs", "cmp-git", "cmp-emoji", "cmp-look", "cmp-calc", "cmp-spell", "cmp-omni", "cmp-rg", "cmp_luasnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle", "ColorizerReloadAllBuffers", "ColorizerAttachToBuffers", "ColorizerDetachFromBuffers" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nÜ\1\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0'\2\4\0B\0\2\1K\0\1\0\fneoclip\19load_extension\14telescope2configs.workflow.telescope.extensions.neoclip\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25configs.utils.notify\frequire\0" },
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFocus" },
    config = { "\27LJ\2\nA\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0&configs.workflow.nvim_tree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["packer.nvim"] = {
    after = { "telescope-packer.nvim" },
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\fplugins\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim",
    wants = { "plenary.nvim" }
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rasi.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/rasi.vim",
    url = "https://github.com/Fymyte/rasi.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["stabilize.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["sxhkd-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/sxhkd-vim",
    url = "https://github.com/kovetskiy/sxhkd-vim"
  },
  ["telescope-bookmarks.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14bookmarks\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-bookmarks.nvim",
    url = "https://github.com/dhruvmanila/telescope-bookmarks.nvim"
  },
  ["telescope-command-palette.nvim"] = {
    config = { "\27LJ\2\nT\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\20command_palette\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-dict.nvim.git"] = {
    config = { "\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\tdict\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-dict.nvim.git",
    url = "https://code.sitosis.com/rudism/telescope-dict.nvim"
  },
  ["telescope-emoji.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0'\2\4\0B\0\2\1K\0\1\0\nemoji\19load_extension\14telescope0configs.workflow.telescope.extensions.emoji\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-env.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\benv\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-heading.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fheading\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim",
    wants = { "telescope.nvim" }
  },
  ["telescope-luasnip.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fluasnip\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/pagankeymaster/telescope-media-files.nvim"
  },
  ["telescope-node-modules.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17node_modules\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-node-modules.nvim",
    url = "https://github.com/nvim-telescope/telescope-node-modules.nvim"
  },
  ["telescope-packer.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vpacker\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["packer.nvim"] = true,
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-repo.nvim"] = {
    config = { "\27LJ\2\nI\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\trepo\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-tele-tabby.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15tele_tabby\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope-tele-tabby.nvim",
    url = "https://github.com/TC72/telescope-tele-tabby.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-env.nvim", "cheatsheet.nvim", "telescope-fzf-native.nvim", "telescope-symbols.nvim", "nvim-neoclip.lua", "telescope-command-palette.nvim", "telescope-node-modules.nvim", "telescope-luasnip.nvim", "telescope-emoji.nvim", "telescope-bookmarks.nvim", "telescope-frecency.nvim", "telescope-tele-tabby.nvim", "telescope-repo.nvim", "telescope-media-files.nvim", "telescope-project.nvim", "telescope-packer.nvim", "telescope-file-browser.nvim", "telescope-dict.nvim.git" },
    commands = { "Telescope" },
    config = { "\27LJ\2\nr\0\0\3\0\5\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0'\2\4\0B\0\2\1K\0\1\0\vnotify\19load_extension\14telescope\31configs.workflow.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"configs.editing.todo_comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28configs.editing.trouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-log-highlighting"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting",
    url = "https://github.com/MTDL9/vim-log-highlighting"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/maker/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["yuck.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/maker/.local/share/nvim/site/pack/packer/opt/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^cmp%-under%-comparator"] = "cmp-under-comparator",
  ["^neogit"] = "neogit",
  ["^nvim%-autopairs"] = "nvim-autopairs",
  ["^packer"] = "packer.nvim",
  ["^sqlite"] = "sqlite.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%configs.editing.markdown_preview\frequire\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0%configs.workflow.nvim_tree.setup\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs.completion\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25configs.utils.notify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-rg ]]
vim.cmd [[ packadd cmp-omni ]]
vim.cmd [[ packadd cmp-spell ]]
vim.cmd [[ packadd cmp-calc ]]
vim.cmd [[ packadd cmp-look ]]
vim.cmd [[ packadd cmp-emoji ]]
vim.cmd [[ packadd cmp-git ]]

-- Config for: cmp-git
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.completion.git\frequire\0", "config", "cmp-git")

vim.cmd [[ packadd LuaSnip ]]

-- Config for: LuaSnip
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31configs.completion.luasnip\frequire\0", "config", "LuaSnip")

vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-dictionary ]]

-- Config for: cmp-dictionary
try_loadstring("\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"configs.completion.dictionary\frequire\0", "config", "cmp-dictionary")

vim.cmd [[ packadd cmp-zsh ]]

-- Config for: cmp-zsh
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27configs.completion.zsh\frequire\0", "config", "cmp-zsh")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleClose lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerReloadAllBuffers lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerReloadAllBuffers", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerAttachToBuffers lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerAttachToBuffers", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerDetachFromBuffers lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerDetachFromBuffers", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cheatsheet lua require("packer.load")({'cheatsheet.nvim'}, { cmd = "Cheatsheet", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CheatsheetEdit lua require("packer.load")({'cheatsheet.nvim'}, { cmd = "CheatsheetEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFocus lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gitsigns lua require("packer.load")({'gitsigns.nvim'}, { cmd = "Gitsigns", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType sh ++once lua require("packer.load")({'cmp-tmux'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType package.json ++once lua require("packer.load")({'cmp-npm'}, { ft = "package.json" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'cmp-nvim-tags'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cmp-nvim-lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'cmp-tmux'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType log ++once lua require("packer.load")({'vim-log-highlighting'}, { ft = "log" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'cmp-tmux'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'cmp-fish', 'cmp-tmux'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType sxhkdrc ++once lua require("packer.load")({'sxhkd-vim'}, { ft = "sxhkdrc" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'cmp-nvim-tags'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'cmp-nvim-tags'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType conf ++once lua require("packer.load")({'cmp-tmux'}, { ft = "conf" }, _G.packer_plugins)]]
vim.cmd [[au FileType yuck ++once lua require("packer.load")({'yuck.vim'}, { ft = "yuck" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType rasi ++once lua require("packer.load")({'rasi.vim'}, { ft = "rasi" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'cmp-nvim-tags', 'markdown-preview.nvim', 'telescope-heading.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'cmp-nvim-tags', 'telescope-heading.nvim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'cmp-nvim-tags'}, { ft = "js" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'stabilize.nvim', 'cmp-cmdline-history', 'cmp-cmdline'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'stabilize.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]], true)
vim.cmd [[source /home/maker/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]]
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/rasi.vim/ftdetect/rasi.vim]], false)
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]], true)
vim.cmd [[source /home/maker/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]]
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]], false)
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]], true)
vim.cmd [[source /home/maker/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]]
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]], false)
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting/ftdetect/log.vim]], true)
vim.cmd [[source /home/maker/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting/ftdetect/log.vim]]
time([[Sourcing ftdetect script at: /home/maker/.local/share/nvim/site/pack/packer/opt/vim-log-highlighting/ftdetect/log.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
