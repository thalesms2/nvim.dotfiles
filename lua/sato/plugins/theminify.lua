return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		async = true,
		activity = true,
		-- loader = function()
		-- dentro config do thema:
		-- before = function()
		-- after = function()
		-- blacklist = {},
		-- whitelist = {},
		-- adiciona transparencia no background
		-- after = function()
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- end,
		{
			"EdenEast/nightfox.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			before = function()
				require("nightfox").setup({
					options = {
						-- Compiled file's destination location
						compile_path = vim.fn.stdpath("cache") .. "/nightfox",
						compile_file_suffix = "_compiled", -- Compiled file suffix
						transparent = false, -- Disable setting background
						terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
						dim_inactive = false, -- Non focused panes set to alternative background
						module_default = true, -- Default enable value for modules
						colorblind = {
							enable = false, -- Enable colorblind support
							simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
							severity = {
								protan = 0, -- Severity [0,1] for protan (red)
								deutan = 0, -- Severity [0,1] for deutan (green)
								tritan = 0, -- Severity [0,1] for tritan (blue)
							},
						},
						styles = { -- Style to be applied to different syntax groups
							comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
							conditionals = "NONE",
							constants = "NONE",
							functions = "NONE",
							keywords = "NONE",
							numbers = "NONE",
							operators = "NONE",
							strings = "NONE",
							types = "NONE",
							variables = "NONE",
						},
						inverse = { -- Inverse highlight for different types
							match_paren = false,
							visual = false,
							search = false,
						},
						modules = { -- List of various plugins and additional options
							-- ...
						},
					},
					palettes = {},
					specs = {},
					groups = {},
				})
			end,
		},
		{
			"olimorris/onedarkpro.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"sho-87/kanagawa-paper.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"everviolet/nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"ellisonleao/gruvbox.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			before = function()
				require("gruvbox").setup({
					terminal_colors = true, -- add neovim terminal colors
					undercurl = true,
					underline = false,
					bold = true,
					italic = {
						strings = false,
						emphasis = false,
						comments = false,
						operators = false,
						folds = false,
					},
					strikethrough = true,
					invert_selection = false,
					invert_signs = false,
					invert_tabline = false,
					invert_intend_guides = false,
					inverse = true, -- invert background for search, diffs, statuslines and errors
					contrast = "", -- can be "hard", "soft" or empty string
					palette_overrides = {},
					overrides = {},
					dim_inactive = false,
					transparent_mode = false,
				})
			end,
		},
		{
			"folke/tokyonight.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			before = function()
				require("tokyonight").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
					transparent = true, -- Enable this to disable setting the background color
					terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
					styles = {
						-- Style to be applied to different syntax groups
						-- Value is any valid attr-list value for `:help nvim_set_hl`
						comments = { italic = false },
						keywords = { italic = false },
						-- Background styles. Can be "dark", "transparent" or "normal"
						sidebars = "dark", -- style for sidebars, see below
						floats = "dark", -- style for floating windows
					},
				})
			end,
		},
		{
			"rose-pine/neovim",
			blacklist = { "rose-pine-dawn" },
			-- after = function()
			-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			-- end,
			before = function()
				require("rose-pine").setup({
					disable_background = false,
					styles = {
						italic = false,
					},
				})
			end,
		},
		{
			"sontungexpt/witch",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"catppuccin/nvim",
			before = function()
				require("catppuccin").setup({
					integrations = {
						snacks = {
							enabled = true,
							indent_scope_color = "mauve",
						},
					},
				})
			end,
			after = function()
				-- deixa fundo e fundo de janela flutuante transparentes
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"scottmckendry/cyberdream.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			before = function()
				require("cyberdream").setup({
					transparent = true,
					bordeless_pickers = true,
					terminal_colors = true,
					extensions = {
						telescope = true,
						mini = true,
					},
				})
			end,
		},

		{ "ThorstenRhau/token" },
		{ "oskarnurm/koda.nvim" },
		{ "yonatanperel/lake-dweller.nvim" },
		{ "silentium-theme/silentium.nvim" },
		{ "serhez/teide.nvim" },
		{ "datsfilipe/min-theme.nvim" },
		{
			"github-main-user/lytmode.nvim",
			before = function()
				require("lytmode").setup({
					-- Enable transparent background
					transparent = true,

					-- Enable italic comment
					italic_comments = true,

					-- Enable italic inlay type hints
					italic_inlayhints = true,

					-- Underline `@markup.link.*` variants
					underline_links = true,

					-- Disable nvim-tree background color
					disable_nvimtree_bg = true,

					-- Apply theme colors to terminal
					terminal_colors = true,

					-- Override colors (see ./lua/lytmode/colors.lua)
					color_overrides = {
						lytLineNumber = "#FFFFFF",
					},

					-- Override highlight groups (see ./lua/lytmode/theme.lua)
					group_overrides = {
						-- this supports the same val table as vim.api.nvim_set_hl
						-- use colors from this colorscheme by requiring lytmode.colors!
						Cursor = { fg = c.lytBack, bg = c.lytGreen, bold = true },
					},
				})
			end,
		},
		{
			"datsfilipe/vesper.nvim",
			before = function()
				require("vesper").setup({
					transparent = false, -- Boolean: Sets the background to transparent
					italics = {
						comments = true, -- Boolean: Italicizes comments
						keywords = true, -- Boolean: Italicizes keywords
						functions = true, -- Boolean: Italicizes functions
						strings = true, -- Boolean: Italicizes strings
						variables = true, -- Boolean: Italicizes variables
					},
					overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
					palette_overrides = {},
				})
			end,
		},
		{ "Abstract-IDE/Abstract-cs" },
		{ "Mofiqul/vscode.nvim" },
		{ "askfiy/visual_studio_code" },
		{
			"marko-cerovac/material.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{ "bluz71/vim-nightfly-colors" },
		{ "bluz71/vim-moonfly-colors" },
		{ "mhartington/oceanic-next" },
		{ "glepnir/zephyr-nvim" },
		{ "sainnhe/edge" },
		{ "Th3Whit3Wolf/space-nvim" },
		{ "ray-x/aurora" },
		{ "tanvirtin/monokai.nvim" },
		{ "ofirgall/ofirkai.nvim" },
		{ "fenetikm/falcon" },
		{ "uhs-robert/oasis.nvim" },
		{ "sainnhe/sonokai" },
		{ "nyoom-engineering/oxocarbon.nvim" },
		{ "savq/melange-nvim" },
		{ "andersevenrud/nordic.nvim" },
		{ "AlexvZyl/nordic.nvim" },
		{ "shaunsingh/nord.nvim" },
		{ "Tsuzat/NeoSolarized.nvim" },
		{ "sainnhe/everforest" },
		{ "sainnhe/gruvbox-material" },
		{ "neanias/everforest-nvim" },
		{ "NTBBloodbath/doom-one.nvim" },
		{ "dracula/vim" },
		{ "Mofiqul/dracula.nvim" },
		{ "yashguptaz/calvera-dark.nvim" },
		{ "nxvu699134/vn-night.nvim" },
		{ "projekt0n/github-nvim-theme" },
		{ "ldelossa/vimdark" },
		{ "Everblush/nvim" },
		{ url = "https://codeberg.org/jthvai/lavender.nvim", branch = "stable" },
		{ "navarasu/onedark.nvim" },
		{
			"T-b-t-nchos/Aquavium.nvim",
			before = function()
				require("aquavium").setup({
					transparent = true,
				})
			end,
		},
		"default",
	},
}
