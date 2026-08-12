return {
	"folke/snacks.nvim",
	desc = "buffers de rascunho com persistencia",
	priority = 1001,
	lazy = false,
	keys = {
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
	},
	opts = {
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
    styles = {
      scratch = {
        position = "float",
        backdrop = 60,
        height = 0.9,
        width = 0.9,
        zindex = 50,
        border = "rounded",
      },
    },
	},
}
