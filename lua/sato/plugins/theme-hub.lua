return {
	"erl-koenig/theme-hub.nvim",
  enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rktjmp/lush.nvim",
	},
	config = function()
		require("theme-hub").setup({
			install_dir = vim.fn.stdpath("data") .. "/theme-hub",
			auto_install_on_select = true,
			apply_after_install = false,
			persistent = true,
		})
	end,
}
