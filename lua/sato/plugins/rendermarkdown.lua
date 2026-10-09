return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		preset = "obsidian",
		file_type = { "markdown", "vimwiki" },
		completions = {
			blink = { enabled = true },
		},
		bullet = {
			enabled = true,
		},
		checkbox = {
			enabled = true,
			position = "inline",
			unchecked = {
				icon = "   󰄱 ",
			},
			checked = {
				icon = "   󰱒 ",
			},
		},
		callout = {
			note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo", category = "github" },
			tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess", category = "github" },
			important = {
				raw = "[!IMPORTANT]",
				rendered = "󰅾 Important",
				highlight = "RenderMarkdownHint",
				category = "github",
			},
			warning = {
				raw = "[!WARNING]",
				rendered = "󰀪 Warning",
				highlight = "RenderMarkdownWarn",
				category = "github",
			},
			caution = {
				raw = "[!CAUTION]",
				rendered = "󰳦 Caution",
				highlight = "RenderMarkdownError",
				category = "github",
			},
			abstract = {
				raw = "[!ABSTRACT]",
				rendered = "󰨸 Abstract",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			summary = {
				raw = "[!SUMMARY]",
				rendered = "󰨸 Summary",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo", category = "obsidian" },
			info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo", category = "obsidian" },
			todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo", category = "obsidian" },
			hint = {
				raw = "[!HINT]",
				rendered = "󰌶 Hint",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			success = {
				raw = "[!SUCCESS]",
				rendered = "󰄬 Success",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			check = {
				raw = "[!CHECK]",
				rendered = "󰄬 Check",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			done = {
				raw = "[!DONE]",
				rendered = "󰄬 Done",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			question = {
				raw = "[!QUESTION]",
				rendered = "󰘥 Question",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn", category = "obsidian" },
			faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn", category = "obsidian" },
			attention = {
				raw = "[!ATTENTION]",
				rendered = "󰀪 Attention",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			failure = {
				raw = "[!FAILURE]",
				rendered = "󰅖 Failure",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			fail = {
				raw = "[!FAIL]",
				rendered = "󰅖 Fail",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			missing = {
				raw = "[!MISSING]",
				rendered = "󰅖 Missing",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			danger = {
				raw = "[!DANGER]",
				rendered = "󱐌 Danger",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			error = {
				raw = "[!ERROR]",
				rendered = "󱐌 Error",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", category = "obsidian" },
			example = {
				raw = "[!EXAMPLE]",
				rendered = "󰉹 Example",
				highlight = "RenderMarkdownHint",
				category = "obsidian",
			},
			quote = {
				raw = "[!QUOTE]",
				rendered = "󱆨 Quote",
				highlight = "RenderMarkdownQuote",
				category = "obsidian",
			},
			cite = {
				raw = "[!CITE]",
				rendered = "󱆨 Cite",
				highlight = "RenderMarkdownQuote",
				category = "obsidian",
			},
		},
		code = {
			-- Turn on / off code block & inline code rendering.
			enabled = true,
			-- Additional modes to render code blocks.
			render_modes = false,
			-- Turn on / off sign column related rendering.
			sign = true,
			-- Whether to conceal nodes at the top and bottom of code blocks.
			conceal_delimiters = true,
			-- Turn on / off language heading related rendering.
			language = true,
			-- Determines where language icon is rendered.
			-- | center | center of code block |
			-- | right  | right of code block  |
			-- | left   | left of code block   |
			position = "left",
			-- Whether to include the language icon above code blocks.
			language_icon = true,
			-- Whether to include the language name above code blocks.
			language_name = true,
			-- Whether to include the language info above code blocks.
			language_info = true,
			-- Amount of padding to add around the language.
			-- If a float < 1 is provided it is treated as a percentage of available window space.
			language_pad = 0,
			-- A list of language names for which rendering will be disabled.
			disable = {},
			-- A list of language names for which background highlighting will be disabled.
			-- Likely because that language has background highlights itself.
			-- Use a boolean to make behavior apply to all languages.
			-- Borders above & below blocks will continue to be rendered.
			disable_background = { "diff" },
			-- Number of lines from start/end to skip rendering background.
			background_inset = 1,
			-- Width of the code block background.
			-- | block | width of the code block  |
			-- | full  | full width of the window |
			width = "full",
			-- Amount of margin to add to the left of code blocks.
			-- If a float < 1 is provided it is treated as a percentage of available window space.
			-- Margin available space is computed after accounting for padding.
			left_margin = 0,
			-- Amount of padding to add to the left of code blocks.
			-- If a float < 1 is provided it is treated as a percentage of available window space.
			left_pad = 0,
			-- Amount of padding to add to the right of code blocks when width is 'block'.
			-- If a float < 1 is provided it is treated as a percentage of available window space.
			right_pad = 0,
			-- Minimum width to use for code blocks when width is 'block'.
			min_width = 0,
			-- Determines how the top / bottom of code block are rendered.
			-- | none  | do not render a border                               |
			-- | thick | use the same highlight as the code body              |
			-- | thin  | when lines are empty overlay the above & below icons |
			-- | hide  | conceal lines unless language name or icon is added  |
			border = "hide",
			-- Used above code blocks to fill remaining space around language.
			language_border = "█",
			-- Added to the left of language.
			language_left = "",
			-- Added to the right of language.
			language_right = "",
			-- Used above code blocks for thin border.
			above = "▄",
			-- Used below code blocks for thin border.
			below = "▀",
			-- Turn on / off inline code related rendering.
			inline = true,
			-- Icon to add to the left of inline code.
			inline_left = "",
			-- Icon to add to the right of inline code.
			inline_right = "",
			-- Padding to add to the left & right of inline code.
			inline_pad = 0,
			-- Priority to assign to code background highlight.
			priority = 140,
			-- Highlight for code blocks.
			highlight = "RenderMarkdownCode",
			-- Highlight for code info section, after the language.
			highlight_info = "RenderMarkdownCodeInfo",
			-- Highlight for language, overrides icon provider value.
			highlight_language = nil,
			-- Highlight for border, use false to add no highlight.
			highlight_border = "RenderMarkdownCodeBorder",
			-- Highlight for language, used if icon provider does not have a value.
			highlight_fallback = "RenderMarkdownCodeFallback",
			-- Highlight for inline code.
			highlight_inline = "RenderMarkdownCodeInline",
			-- Highlight for inline code left icon, default to reverse of highlight_inline.
			highlight_inline_left = nil,
			-- Highlight for inline code right icon, default to reverse of highlight_inline.
			highlight_inline_right = nil,
			-- Determines how code blocks & inline code are rendered.
			-- | none     | { enabled = false }                           |
			-- | normal   | { language = false }                          |
			-- | language | { disable_background = true, inline = false } |
			-- | full     | uses all default values                       |
			style = "full",
		},
		html = {
			-- Turn on / off all HTML rendering
			enabled = true,
			comment = {
				-- Turn on / off HTML comment concealing
				conceal = false,
			},
		},
		heading = {
			enabled = true,
			sign = true,
			signs = { "󰫎 " },
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
			width = "full",
		},
		link = {
			enabled = true,
			render_modes = false,
			footnote = {
				enabled = true,
				superscript = true,
				prefix = "",
				suffix = "",
			},
			image = "󰥶 ",
			email = "󰀓 ",
			hyperlink = "󰌹 ",
			highlight = "RenderMarkdownLink",
			wiki = {
				icon = "󱗖 ",
				highlight = "RenderMarkdownWikiLink",
			},
			custom = {
				web = { pattern = "^http", icon = "󰖟 " },
				discord = { pattern = "discord%.com", icon = "󰙯 " },
				github = { pattern = "github%.com", icon = "󰊤 " },
				gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
				google = { pattern = "google%.com", icon = "󰊭 " },
				neovim = { pattern = "neovim%.io", icon = " " },
				reddit = { pattern = "reddit%.com", icon = "󰑍 " },
				stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
				wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
				youtube = { pattern = "youtube%.com", icon = "󰗃 " },
			},
		},
	},
}
