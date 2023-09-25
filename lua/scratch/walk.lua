local _module_0 = { }
local Task = require("plenary.job")
local Path = require("plenary.path")
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
local gitsigns = require("gitsigns")
local defaults = {
	menu = {
		position = "50%",
		size = {
			width = 25,
			height = 5
		},
		border = {
			style = "single",
			text = {
				top = "Walk",
				top_align = "center"
			}
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal"
		}
	}
}
local make_menu
make_menu = function(file, items, options)
	if items == nil then
		items = { }
	end
	if options == nil then
		options = { }
	end
	options = vim.tbl_deep_extend("keep", options, defaults.menu)
	local extension = vim.fn.fnamemodify(file, ":e")
	local tmpfile = Path:new("/tmp/commit." .. tostring(extension))
	tmpfile:touch({
		exists_ok = true
	})
	local params = {
		lines = vim.tbl_map(Menu.item, items),
		max_width = 20,
		keymap = {
			focus_next = {
				"j",
				"<Down>",
				"<Tab>"
			},
			focus_prev = {
				"k",
				"<Up>",
				"<S-Tab>"
			},
			close = {
				"<Esc>",
				"<C-c>"
			},
			submit = {
				"<CR>",
				"<Space>"
			}
		},
		on_change = function(hash)
			return gitsigns.show(hash)
		end,
		on_submit = function(hash)
			vim.fn.system({
				"git",
				"checkout",
				hash,
				file
			})
			return gitsigns.refresh()
		end
	}
	return Menu(options, params)
end
local walk
walk = function()
	local file = vim.fn.expand("%")
	local task = Task:new({
		"git",
		"log",
		"--pretty=format:%h",
		"--no-notes",
		"--no-color",
		"--no-decorate",
		"--ignore-submodules",
		file,
		on_exit = function(self, code)
			if code ~= 0 then
				return
			end
			return vim.schedule(function()
				return make_menu(file, self:result()):mount()
			end)
		end
	})
	return task:start()
end
_module_0["walk"] = walk
walk()
return _module_0
