return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("obsidian").setup({
            legacy_commands = false,
			workspaces = {
				{
					name = "Obsidian",
					path = "~/gh/Obsidian",
				},
			},
			notes_subdir = "notes",
			daily_notes = {
				folder = "notes/dailies",
				date_format = "%Y-%m-%d",
				default_tags = { "daily" },
				template = "daily",
			},
			new_notes_location = "notes_subdir",
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					suffix = "new-note"
				end
				return suffix
			end,
			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,
			frontmatter = {
				enabled = true,
				func = require("obsidian.builtin").frontmatter,
				sort = { "id", "aliases", "tags" },
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				substitutions = {},
			},
			picker = {
				name = "snacks.picker",
				note_mappings = {
					new = "<C-x>",
					insert_link = "<C-l>",
				},
				tag_mappings = {
					tag_note = "<C-x>",
					insert_tag = "<C-l>",
				},
			},
			search = {
				sort_by = "modified",
				sort_reversed = true,
				max_lines = 1000,
			},
			open_notes_in = "current",
			callbacks = {
				post_setup = function() end,
				enter_note = function()
					vim.keymap.set(
						"n",
						"<leader>ch",
						"<cmd>Obsidian toggle_checkbox<cr>",
						{ buffer = true, desc = "Obsidian toggle checkbox" }
					)
					vim.keymap.set(
						"n",
						"<cr>",
						require("obsidian.api").smart_action,
						{ buffer = true, desc = "Obsidian Smart Action" }
					)
					vim.ui.open = (function(overridden)
						return function(uri, opt)
							if vim.endswith(uri, ".png") then
								vim.cmd("edit " .. uri) -- early return to just open in neovim
								return
							elseif vim.endswith(uri, ".pdf") then
								opt = { cmd = { "zathura" } } -- override open app
							end
							return overridden(uri, opt)
						end
					end)(vim.ui.open)
				end,
				leave_note = function() end,

				pre_write_note = function() end,

				post_set_workspace = function() end,
			},
			ui = {
				enable = false,
			},
			attachments = {
				folder = "assets/imgs",
				img_name_func = function()
					return string.format("%s-", os.time())
				end,
				img_text_func = function()
					return string.format("Pasted image %s", os.date("%Y%m%d%H%M%S"))
				end,
			},
		})

		vim.keymap.set("n", "<leader>sO", "<cmd>ObsidianQuickSwitch<cr>", { desc = "[S]earch [O]bsidian files" })
		vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "[O]bsidian change [W]orkspace" })
		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "[O]bsidian [N]ew file" })
		vim.keymap.set("n", "<leader>so", "<cmd>ObsidianSearch<cr>", { desc = "[S]earch by grep in [O]bsidian files" })
		vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "[O]bsidian: List [L]inks on file" })
		vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<cr>", { desc = "[O]bsidian: List [D]ailies notes" })
		vim.keymap.set(
			"n",
			"<leader>ot",
			"<cmd>ObsidianNewFromTemplate<cr>",
			{ desc = "[O]bsidian: Create new from [T]emplate" }
		)
		vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianTemplate<cr>", { desc = "[O]bsidian: List [T]emplates" })

		vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<cr>", { desc = "[O]bsidian: [O]pen file on obsidian" })
		vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "[O]bsidian: List [B]acklinks" })
		vim.keymap.set("n", "<leader>o.", "<cmd>ObsidianTags<cr>", { desc = "[O]bsidian: List tags" })

		vim.keymap.set("n", "<leader>o2", "<cmd>ObsidianToday<cr>", { desc = "[O]bsidian: " })
		vim.keymap.set("n", "<leader>o1", "<cmd>ObsidianYesterday<cr>", { desc = "[O]bsidian: " })
		vim.keymap.set("n", "<leader>o3", "<cmd>ObsidianTomorrow<cr>", { desc = "[O]bsidian: " })

		vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "[O]bsidian: [E]xtract notes" })
		vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "[O]bsidian: [P]aste image" })
		vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "[O]bsidian: [R]ename file" })
		vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianTOC<cr>", { desc = "[O]bsidian: [O]bjects" })
	end,
}
