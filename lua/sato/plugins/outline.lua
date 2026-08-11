return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { 
		{ "<leader>out", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		symbol_folding = {
			autofold_depth = 0,
		},
		outline_window = {
			width = 33,
		},
	},
}
