local ok, telescope = pcall(require, "telescope")
if not ok then return end

local actions_custom = require("plugins.telescope.actions")
local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

local ignore_files = {
  "steam",
  ".git",
  "node_modules",
  "venv",
  ".venv",
  "dosdevices",
  "drive_c",
  "compatdata",
  "cargo",
  ".conan",
  "gem",
  "Brave",
  ".paradox-launcher",
  ".cache",
  "Trash",
  "unity3d",
  "Paradox Interactive",
  "autostart",
  "pulse",
  "droidcam",
  "swap",
  "kdeconnect",
  "OpenTabletDriver",
  ".icons",
  "downloads",
  "secret",
  ".librewolf",
  "kernel",
  "dic",
  "vivaldi",
  "krita",
  "mime",
  "chromium",
  "inkscape",
  "syncthing",
  "xournalpp",
  ".ssh",
  "feh",
  "discord",
  "BetterDiscord",
  "lutris",
  "secrets",
  ".var",
  "pictures",
  "easyeffects",
  ".android",
  ".cmake",
  ".dotnet",
  ".nuget",
  ".vnc",
  ".themes",
}

telescope.setup({
  dynamic_preview_title = true,
  pickers = {
    command_history = {
      prompt_prefix = "   ",
    },
    symbols = {
      prompt_prefix = "   ",
    },
    buffers = {
      sort_lastused = true,
      prompt_prefix = "   ",
      previewer = false,
      layout_config = {
        width = 0.3,
        height = 0.4,
      },
      mappings = {
        ["i"] = {
          ["<C-K>"] = actions.preview_scrolling_up,
          ["<C-J>"] = actions.preview_scrolling_down,
          ["<C-D>"] = actions_custom.delete_buffer + actions.move_to_top,
        },
        ["n"] = {
          ["v"] = actions_custom.vertical,
          ["dd"] = actions_custom.delete_buffer + actions.move_to_top,
        },
      },
    },
    find_files = {
      no_ignore = true,
      hidden = true,
      prompt_prefix = "   ",
      mappings = {
        ["i"] = {
          ["<C-K>"] = actions.preview_scrolling_up,
          ["<C-J>"] = actions.preview_scrolling_down,
          ["<C-Space>"] = actions_custom.interactive_regex,
        },
        ["n"] = {
          ["v"] = actions_custom.vertical,
          ["p"] = layout.toggle_preview,
        },
      },
    },
    oldfiles = {
      prompt_prefix = "   ",
    },
    colorscheme = {
      prompt_prefix = "   ",
    },
    highlights = {
      prompt_prefix = "   ",
    },
    live_grep = {
      prompt_prefix = "   ",
      mappings = {
        ["i"] = {
          ["<C-K>"] = actions.preview_scrolling_up,
          ["<C-J>"] = actions.preview_scrolling_down,
          ["<C-S>"] = actions_custom.set_preview_filetype,
        },
        ["n"] = {
          ["v"] = actions_custom.vertical,
          ["p"] = layout.toggle_preview,
        },
      },
    },
    git_commits = {
      prompt_prefix = "  ",
    },
    git_bcommits = {
      prompt_prefix = "  ",
    },
    git_branches = {
      prompt_prefix = " שׂ ",
    },
    git_status = {
      prompt_prefix = "   ",
      git_icons = {
        added = "+",
        changed = "~",
        copied = ">",
        deleted = "-",
        renamed = "➡",
        unmerged = "‡",
        untracked = "?",
      },
    },
    git_files = {
      prompt_prefix = " שׂ ",
    },
    commands = {
      prompt_prefix = "   ",
    },
    registers = {
      prompt_prefix = "   ",
      initial_mode = "normal",
      theme = "cursor",
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      layout_config = {
        preview_cutoff = 1,
        width = function(_, max_col, _) return math.min(max_col, 70) end,
        height = function(_, _, max_line) return math.min(max_line, 15) end,
      },
    },
    spell_suggests = {
      prompt_prefix = "   ",
    },
    keymaps = {
      prompt_prefix = "   ",
    },
    lsp_code_actions = {
      prompt_prefix = "  ",
      theme = "cursor",
    },
    lsp_references = {
      prompt_prefix = "   ",
    },
    lsp_implementations = {
      prompt_prefix = "   ",
    },
    lsp_document_diagnostics = {
      prompt_prefix = "   ",
    },
  },
  defaults = {
    file_ignore_patterns = ignore_files,
    prompt_prefix = "   ",
    selection_caret = " |  ",
    entry_prefix = "    ",
    initial_mode = "insert",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.6,
        results_width = 0.7,
      },
      vertical = { mirror = true },
      width = 0.9,
      height = 0.9,
      preview_cutoff = 120,
    },
    winblend = 0,
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  extensions = {
    media = {
      prompt_prefix = "   ",
      backend = "ueberzug",
      flags = {
        chafa = {
          move = true,
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        layout_strategy = "cursor",
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      }),
    }
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("media")
require("telescope").load_extension("track")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("kao")
require("telescope").load_extension("gradle")
