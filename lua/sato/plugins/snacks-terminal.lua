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
		-- terminais como buffer normal (aparecem no <leader>fb)
		{ "<leader>wttn", function() vim.cmd("tabnew | terminal") end, desc = "Terminal em nova aba" },
		{ "<leader>wttv", function() vim.cmd("vsplit | terminal") end, desc = "Terminal em split vertical" },
		{ "<leader>wtts", function() vim.cmd("split | terminal") end, desc = "Terminal em split horizontal" },
	},
	init = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			group = vim.api.nvim_create_augroup("sato_buffer_terminal", { clear = true }),
			callback = function(ev)
				-- o terminal flutuante do snacks tem comportamento próprio
				if vim.bo[ev.buf].filetype == "snacks_terminal" then return end
				vim.bo[ev.buf].buflisted = true
				vim.wo.number = false
				vim.wo.relativenumber = false
				for _, dir in ipairs({ "h", "j", "k", "l" }) do
					vim.keymap.set("t", "<C-" .. dir .. ">", "<C-\\><C-n><cmd>wincmd " .. dir .. "<CR>", {
						buffer = ev.buf,
						desc = "Move para janela " .. dir,
					})
				end
				vim.cmd.startinsert()
			end,
		})
	end,
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
