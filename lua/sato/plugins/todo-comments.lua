return { -- Highlight todo, notes, etc in comments
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	optional = true,
	opts = {
		keywords = {
			TODO = { alt = { "TODO", "todo", "ToDo" } },
			FIXME = { alt = { "FIX", "FIXME", "fix", "fixme", "FixMe" } },
		},
		search = {
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--hidden",
			},
		},
	},
	keys = {
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
		{ "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
		{
			"<leader>sT",
			function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,
			desc = "Todo/Fix/Fixme",
		},
	},
}
