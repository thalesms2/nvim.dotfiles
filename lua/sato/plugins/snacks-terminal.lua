return {
	"folke/snacks.nvim",
	desc = "criar terminais flutuantes e splits",
	priority = 1001,
	lazy = false,
	keys = {
		{ "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
		{ "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
		{
			"<leader>te",
			function()
				Snacks.terminal.open(nil, {
          name = "Terminal",
          auto_insert = false,
					win = {
						split = "below",
						height = 0.4,
						position = "bottom",
						focusable = true,
						enter = false,
						show = true,
						hide = false,
					},
				})
			end,
			desc = "testes",
		},
	},
	opts = {
		terminal = {
			win = {
				style = "terminal",
			},
		},
		styles = {
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
