return {
	keys = {
		{
			"<leader>lg",
			function() Snacks.lazygit() end,
			desc = "[L]azy [G]it",
		},
		{
			"<c-/>",
			function() Snacks.terminal() end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function() Snacks.terminal() end,
			desc = "which_key_ignore",
		},
		{
			"<leader>n",
			function()
				Snacks.scratch({
					name = "Scratch",
					icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
					autowrite = true, -- automatically write when the buffer is hidden
					win = {
						style = "scratch",
						on_win = function()
							vim.cmd("normal! G")
							vim.cmd("normal! $")
						end,
					},
					ft = "markdown",
					file = os.getenv("HOME") .. "/gh/Obsidian/notes/notas.md",
				})
			end,
			desc = "Quick [N]otes",
		},
		{
			"<leader>t",
			function()
				Snacks.scratch({
					name = "Scratch",
					icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
					autowrite = true, -- automatically write when the buffer is hidden
					win = {
						style = "scratch",
						on_win = function()
							vim.cmd("normal! G")
							vim.cmd("normal! $")
						end,
					},
					ft = "markdown",
					file = os.getenv("HOME") .. "/gh/Obsidian/notes/todo.md",
				})
			end,
			desc = "Quick [T]odos",
		},
		{
			"<leader>ez",
			function() Snacks.zen() end,
			desc = "Snacks: Zen mode",
		},
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>ln", function() Snacks.picker.notifications() end, desc = "Notification History" },
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		-- find
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{
			"<leader>fc",
			function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
			desc = "Find Config File",
		},
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
		-- git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
		-- gh
		{ "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
		{ "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
		{ "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
		{ "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
		-- Grep
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{
			"<leader>sw",
			function() Snacks.picker.grep_word() end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
		{ "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
		{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
		{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
		{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
		{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
		{ "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
		{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
		{ "<leader>D", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		{ "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
		{ "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	},
	"folke/snacks.nvim",
	priority = 999,
	lazy = false,
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		image = { enabled = true },
		indent = { enabled = false },
		input = { enabled = false },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			prompt = " ",
			sources = {},
			focus = "input",
			show_delay = 5000,
			limit_live = 10000,
			layout = {
				cycle = true,
				--- Use the default layout or vertical if the window is too narrow
				preset = function() return vim.o.columns >= 120 and "default" or "vertical" end,
			},
			---@class snacks.picker.matcher.Config
			matcher = {
				fuzzy = true, -- use fuzzy matching
				smartcase = true, -- use smartcase
				ignorecase = true, -- use ignorecase
				sort_empty = false, -- sort results when the search string is empty
				filename_bonus = true, -- give bonus for matching file names (last part of the path)
				file_pos = true, -- support patterns like `file:line:col` and `file:line`
				-- the bonusses below, possibly require string concatenation and path normalization,
				-- so this can have a performance impact for large lists and increase memory usage
				cwd_bonus = false, -- give bonus for matching files in the cwd
				frecency = false, -- frecency bonus
				history_bonus = false, -- give more weight to chronological order
			},
			sort = {
				-- default sort is by score, text length and index
				fields = { "score:desc", "#text", "idx" },
			},
			ui_select = true, -- replace `vim.ui.select` with the snacks picker
			---@class snacks.picker.formatters.Config
			formatters = {
				text = {
					ft = nil, ---@type string? filetype for highlighting
				},
				file = {
					filename_first = false, -- display filename before the file path
					--- * left: truncate the beginning of the path
					--- * center: truncate the middle of the path
					--- * right: truncate the end of the path
					---@type "left"|"center"|"right"
					truncate = "center",
					min_width = 40, -- minimum length of the truncated path
					filename_only = false, -- only show the filename
					icon_width = 2, -- width of the icon (in characters)
					git_status_hl = true, -- use the git status highlight group for the filename
				},
				selected = {
					show_always = false, -- only show the selected column when there are multiple selections
					unselected = true, -- use the unselected icon for unselected items
				},
				severity = {
					icons = true, -- show severity icons
					level = false, -- show severity level
					---@type "left"|"right"
					pos = "left", -- position of the diagnostics
				},
			},
			---@class snacks.picker.previewers.Config
			previewers = {
				diff = {
					-- fancy: Snacks fancy diff (borders, multi-column line numbers, syntax highlighting)
					-- syntax: Neovim's built-in diff syntax highlighting
					-- terminal: external command (git's pager for git commands, `cmd` for other diffs)
					style = "fancy", ---@type "fancy"|"syntax"|"terminal"
					cmd = { "delta" }, -- example for using `delta` as the external diff command
					---@type vim.wo?|{} window options for the fancy diff preview window
					wo = {
						breakindent = true,
						wrap = true,
						linebreak = true,
						showbreak = "",
					},
				},
				git = {
					args = {}, -- additional arguments passed to the git command. Useful to set pager options usin `-c ...`
				},
				file = {
					max_size = 1024 * 1024, -- 1MB
					max_line_length = 500, -- max line length
					ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
				},
				man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
			},
			---@class snacks.picker.jump.Config
			jump = {
				jumplist = true, -- save the current position in the jumplist
				tagstack = false, -- save the current position in the tagstack
				reuse_win = false, -- reuse an existing window if the buffer is already open
				close = true, -- close the picker when jumping/editing to a location (defaults to true)
				match = false, -- jump to the first match position. (useful for `lines`)
			},
			toggles = {
				follow = "f",
				hidden = "h",
				ignored = "i",
				modified = "m",
				regex = { icon = "R", value = false },
			},
			win = {
				-- input window
				input = {
					keys = {
						-- to close the picker on ESC instead of going to normal mode,
						-- add the following keymap to your config
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
						["/"] = "toggle_focus",
						["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
						["<C-Up>"] = { "history_back", mode = { "i", "n" } },
						["<C-c>"] = { "cancel", mode = "i" },
						["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
						["<CR>"] = { "confirm", mode = { "n", "i" } },
						["<Down>"] = { "list_down", mode = { "i", "n" } },
						["<Esc>"] = "cancel",
						["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
						["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
						["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
						["<Up>"] = { "list_up", mode = { "i", "n" } },
						["<a-d>"] = { "inspect", mode = { "n", "i" } },
						["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
						["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
						["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
						["<a-r>"] = { "toggle_regex", mode = { "i", "n" } },
						["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
						["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
						["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
						["<c-a>"] = { "select_all", mode = { "n", "i" } },
						["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
						["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
						["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
						["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
						["<c-j>"] = { "list_down", mode = { "i", "n" } },
						["<c-k>"] = { "list_up", mode = { "i", "n" } },
						["<c-n>"] = { "list_down", mode = { "i", "n" } },
						["<c-p>"] = { "list_up", mode = { "i", "n" } },
						["<c-q>"] = { "qflist", mode = { "i", "n" } },
						["<c-s>"] = { "edit_split", mode = { "i", "n" } },
						["<c-t>"] = { "tab", mode = { "n", "i" } },
						["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
						["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
						["<c-r>#"] = { "insert_alt", mode = "i" },
						["<c-r>%"] = { "insert_filename", mode = "i" },
						["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
						["<c-r><c-f>"] = { "insert_file", mode = "i" },
						["<c-r><c-l>"] = { "insert_line", mode = "i" },
						["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
						["<c-r><c-w>"] = { "insert_cword", mode = "i" },
						["<c-w>H"] = "layout_left",
						["<c-w>J"] = "layout_bottom",
						["<c-w>K"] = "layout_top",
						["<c-w>L"] = "layout_right",
						["?"] = "toggle_help_input",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["j"] = "list_down",
						["k"] = "list_up",
						["q"] = "cancel",
					},
					b = {
						minipairs_disable = true,
					},
				},
				-- result list window
				list = {
					keys = {
						["/"] = "toggle_focus",
						["<2-LeftMouse>"] = "confirm",
						["<CR>"] = "confirm",
						["<Down>"] = "list_down",
						["<Esc>"] = "cancel",
						["<S-CR>"] = { { "pick_win", "jump" } },
						["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
						["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
						["<Up>"] = "list_up",
						["<a-d>"] = "inspect",
						["<a-f>"] = "toggle_follow",
						["<a-h>"] = "toggle_hidden",
						["<a-i>"] = "toggle_ignored",
						["<a-m>"] = "toggle_maximize",
						["<a-p>"] = "toggle_preview",
						["<a-w>"] = "cycle_win",
						["<c-a>"] = "select_all",
						["<c-b>"] = "preview_scroll_up",
						["<c-d>"] = "list_scroll_down",
						["<c-f>"] = "preview_scroll_down",
						["<c-j>"] = "list_down",
						["<c-k>"] = "list_up",
						["<c-n>"] = "list_down",
						["<c-p>"] = "list_up",
						["<c-q>"] = "qflist",
						["<c-g>"] = "print_path",
						["<c-s>"] = "edit_split",
						["<c-t>"] = "tab",
						["<c-u>"] = "list_scroll_up",
						["<c-v>"] = "edit_vsplit",
						["<c-w>H"] = "layout_left",
						["<c-w>J"] = "layout_bottom",
						["<c-w>K"] = "layout_top",
						["<c-w>L"] = "layout_right",
						["?"] = "toggle_help_list",
						["G"] = "list_bottom",
						["gg"] = "list_top",
						["i"] = "focus_input",
						["j"] = "list_down",
						["k"] = "list_up",
						["q"] = "cancel",
						["zb"] = "list_scroll_bottom",
						["zt"] = "list_scroll_top",
						["zz"] = "list_scroll_center",
					},
					wo = {
						conceallevel = 2,
						concealcursor = "nvc",
					},
				},
				-- preview window
				preview = {
					keys = {
						["<Esc>"] = "cancel",
						["q"] = "cancel",
						["i"] = "focus_input",
						["<a-w>"] = "cycle_win",
					},
				},
			},
			---@class snacks.picker.icons
			icons = {
				files = {
					enabled = true, -- show file icons
					dir = "󰉋 ",
					dir_open = "󰝰 ",
					file = "󰈔 ",
				},
				keymaps = {
					nowait = "󰓅 ",
				},
				tree = {
					vertical = "│ ",
					middle = "├╴",
					last = "└╴",
				},
				undo = {
					saved = " ",
				},
				ui = {
					live = "󰐰 ",
					hidden = "h",
					ignored = "i",
					follow = "f",
					selected = "● ",
					unselected = "○ ",
					-- selected = " ",
				},
				git = {
					enabled = true, -- show git icons
					commit = "󰜘 ", -- used by git log
					staged = "●", -- staged changes. always overrides the type icons
					added = "",
					deleted = "",
					ignored = " ",
					modified = "○",
					renamed = "",
					unmerged = " ",
					untracked = "?",
				},
				diagnostics = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				},
				lsp = {
					unavailable = "",
					enabled = " ",
					disabled = " ",
					attached = "󰖩 ",
				},
				kinds = {
					Array = " ",
					Boolean = "󰨙 ",
					Class = " ",
					Color = " ",
					Control = " ",
					Collapsed = " ",
					Constant = "󰏿 ",
					Constructor = " ",
					Copilot = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = " ",
					Function = "󰊕 ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = "󰊕 ",
					Module = " ",
					Namespace = "󰦮 ",
					Null = " ",
					Number = "󰎠 ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = "󱄽 ",
					String = " ",
					Struct = "󰆼 ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Unknown = " ",
					Value = " ",
					Variable = "󰀫 ",
				},
			},
			---@class snacks.picker.db.Config
			db = {
				-- path to the sqlite3 library
				-- If not set, it will try to load the library by name.
				-- On Windows it will download the library from the internet.
				sqlite3_path = nil, ---@type string?
			},
			---@class snacks.picker.debug
			debug = {
				scores = false, -- show scores in the list
				leaks = false, -- show when pickers don't get garbage collected
				explorer = false, -- show explorer debug info
				files = false, -- show file debug info
				grep = false, -- show file debug info
				proc = false, -- show proc debug info
				extmarks = false, -- show extmarks errors
			},
		},
		notifier = { enabled = true, style = "compact" },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scratch = {
			name = "Scratch",
			ft = function()
				if vim.bo.buftype == "" and vim.bo.filetype ~= "" then return vim.bo.filetype end
				return "markdown"
			end,
			---@type string|string[]?
			icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
			root = vim.fn.stdpath("data") .. "/scratch",
			autowrite = true, -- automatically write when the buffer is hidden
			-- unique key for the scratch file is based on:
			-- * name
			-- * ft
			-- * vim.v.count1 (useful for keymaps)
			-- * cwd (optional)
			-- * branch (optional)
			filekey = {
				cwd = true, -- use current working directory
				branch = true, -- use current branch name
				count = true, -- use vim.v.count1
			},
			win = { style = "scratch" },
			---@type table<string, snacks.win.Config>
			win_by_ft = {
				lua = {
					keys = {
						["source"] = {
							"<cr>",
							function(self)
								local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
								Snacks.debug.run({ buf = self.buf, name = name })
							end,
							desc = "Source buffer",
							mode = { "n", "x" },
						},
					},
				},
			},
		},
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		terminal = {
			win = {
				style = "terminal",
			},
		},
		toggle = {
			map = vim.keymap.set, -- keymap.set function to use
			which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
			enabled = true,
			notify = true, -- show a notification when toggling
			-- icons for enabled/disabled states
			icon = {
				enabled = " ",
				disabled = " ",
			},
			-- colors for enabled/disabled states
			color = {
				enabled = "green",
				disabled = "yellow",
			},
			wk_desc = {
				enabled = "Disable ",
				disabled = "Enable ",
			},
		},
		zen = {
			---@type table<string, boolean>
			toggles = {
				dim = true,
				git_signs = false,
				mini_diff_signs = false,
				-- diagnostics = false,
				-- inlay_hints = false,
			},
			show = {
				statusline = false, -- can only be shown when using the global statusline
				tabline = false,
			},
			---@type snacks.win.Config
			win = { style = "zen" },
			--- Callback when the window is opened.
			---@param win snacks.win
			on_open = function(win) end,
			--- Callback when the window is closed.
			---@param win snacks.win
			on_close = function(win) end,
			--- Options for the `Snacks.zen.zoom()`
			---@type snacks.zen.Config
			zoom = {
				toggles = {},
				show = { statusline = true, tabline = true },
				win = {
					backdrop = false,
					width = 0, -- full width
				},
			},
		},
		words = { enabled = true },
		styles = {
			zen = {
				enter = true,
				fixbuf = false,
				minimal = false,
				width = 120,
				height = 0,
				backdrop = { transparent = true, blend = 40 },
				keys = { q = false },
				zindex = 40,
				wo = {
					winhighlight = "NormalFloat:Normal",
				},
				w = {
					snacks_main = true,
				},
			},
			scratch = {
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
				border = "rounded",
			},
			terminal = {
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
				border = "rounded",
				bo = {
					filetype = "snacks_terminal",
				},
				wo = {},
				keys = {
					q = "hide",
					gf = function(self)
						local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
						if f == "" then
							Snacks.notify.warn("No file under cursor")
						else
							self:hide()
							vim.schedule(function() vim.cmd("e " .. f) end)
						end
					end,
					term_normal = {
						"<esc>",
						function(self)
							self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
							if self.esc_timer:is_active() then
								self.esc_timer:stop()
								vim.cmd("stopinsert")
							else
								self.esc_timer:start(200, 0, function() end)
								return "<esc>"
							end
						end,
						mode = "t",
						expr = true,
						desc = "Double escape to normal mode",
					},
				},
			},
		},
	},
}
