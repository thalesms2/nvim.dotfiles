return {
	"folke/snacks.nvim",
	desc = "git",
	priority = 1001,
	lazy = false,
	keys = {
		{ "<leader>Gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
		{ "<leader>GI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
		{ "<leader>Gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
		{ "<leader>GP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
		{ "<leader>Gr", function() Snacks.gitbrowse() end, desc = "[G]it open on Browse" },
		{ "<leader>Gb", function() Snacks.git.blame_line() end, desc = "[G]it [B]lame" },
		{ "<leader>lg", function() Snacks.lazygit() end, desc = "[L]azy [G]it" },
	},
	opts = {
		gh = {
			enabled = true,
			keys = {
				select = { "<cr>", "gh_actions", desc = "Select Action" },
				edit = { "i", "gh_edit", desc = "Edit" },
				comment = { "a", "gh_comment", desc = "Add Comment" },
				close = { "c", "gh_close", desc = "Close" },
				reopen = { "o", "gh_reopen", desc = "Reopen" },
			},
		},
    git = {
      enabled = true,
    },
    gitbrowse = {
      enabled = true,
    },
		lazygit = { enabled = true },
		picker = {
			sources = {
				gh_issue = {},
				gh_pr = {},
			},
		},
		styles = {},
	},
}
