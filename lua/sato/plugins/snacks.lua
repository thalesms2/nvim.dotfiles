return {
	"folke/snacks.nvim",
	desc = "collection of small QoL plugins",
	priority = 1001,
	lazy = false,
	keys = {},
	opts = {
		bigfile = { enabled = true },
		explorer = { enabled = false }, -- explorer testar dps
		health = { enabled = false },
		image = { enabled = true }, -- testar e olhar doc
		indent = { enabled = true },
		input = { enabled = true },
    keymap = { enabled = false }, -- doc possibilidades
		notifier = { enabled = true, style = "compact" },
    profiler = { enabled = false }, -- validar 
		quickfile = { enabled = true },
		scroll = { enabled = true },
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
    win = { enabled = false },
		words = { enabled = true },
		styles = {},
	},
}

  -- bufdelete deletar buffers
  -- toggle keymaps
