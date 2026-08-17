return {
	"mfussenegger/nvim-dap",
	desc = "Debug",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mxsdev/nvim-dap-vscode-js",
	},
	keys = {
		{ "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
		{ "<F1>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
		{ "<F2>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
		{ "<F3>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
		{ "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle [B]reakpoint" },
		{
			"<leader>B",
			function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
			desc = "Debug: Set [B]reakpoint",
		},
		{ "<F4>", function() require("dapui").toggle() end, desc = "Debug: Toggle UI" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local runtime = vim.uv.fs_stat("bun.lock") and "bun" or "node"
		local js_debug_path = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter"

		-- 2. Define the adapter instance
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = js_debug_path,
				args = { "${port}" },
			},
		}
		dap.set_log_level("TRACE")

		if not dap.adapters["node"] then
			dap.adapters["node"] = function(cb, config)
				if config.type == "node" then config.type = "pwa-node" end

				local nativeAdapter = dap.adapters["pwa-node"]

				if type(nativeAdapter) == "function" then
					nativeAdapter(cb, config)
				else
					cb(nativeAdapter)
				end
			end
		end

		local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

		local vscode = require("dap.ext.vscode")
		vscode.type_to_filetypes["node"] = js_filetypes
		vscode.type_to_filetypes["pwa-node"] = js_filetypes

		local dap_configurations = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = runtime,
				runtimeArgs = runtime == "bun" and { "run", "--watch" } or nil,
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				cwd = "${workspaceFolder}",
			},
			{
				name = "NestJS: debug",
				command = "nvm use 24;npm run start:debug",
				type = "pwa-node",
				request = "launch",
				trace = true,
				cwd = vim.fn.getcwd(),
				runtimeExecutable = runtime,
				runtimeArgs = runtime == "bun" and { "run" } or nil,
				program = "${workspaceFolder}/node_modules/@nestjs/cli/bin/nest.js",
				args = {
					"start",
					"--debug",
					"--watch",
					"--preserveWatchOutput",
				},
				sourceMaps = true,
				stopOnEntry = false,
				console = "integratedTerminal",
				protocol = "auto",
				outDir = "${workspaceFolder}/dist",
				restart = true,
			},
			{
				name = "Run Debugger k",
				command = "nvm use 24;npm run start:debug",
				type = "pwa-node",
				cwd = "${workspaceFolder}",
				request = "launch",
			},
			{
				name = "Run Debugger Attach",
				type = "pwa-node",
				cwd = "${workspaceFolder}",
				request = "attach",
				port = 9229,
				restart = true,
			},
		}

		for _, language in ipairs(js_filetypes) do
			if not dap.configurations[language] then dap.configurations[language] = dap_configurations end
		end

		dap.adapters.php = {
			type = "server",
			host = "127.0.0.1",
			port = 9000,
		}

		dap.configurations.php = {
			{
				name = "Listen for XDebug",
				type = "php",
				request = "launch",
				port = 9000,
				pathMappings = {
					["/app"] = vim.fn.getcwd(), -- ajuste de acordo com o seu diretório
				},
				ignore = { "/vendor/*/*.php" },
				xdebugSettings = {
					max_data = 100000000000000000,
					show_hidden = 1,
					max_children = 9999,
				},
				log = true,
				externalConsole = false,
			},
		}

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},
		})

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Change breakpoint icons
		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
		local breakpoint_icons = vim.g.have_nerd_font
				and {
					Breakpoint = "",
					BreakpointCondition = "",
					BreakpointRejected = "",
					LogPoint = "",
					Stopped = "",
				}
			or {
				Breakpoint = "●",
				BreakpointCondition = "⊜",
				BreakpointRejected = "⊘",
				LogPoint = "◆",
				Stopped = "⭔",
			}
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		local close_ui_smart = function(session)
			-- if session and session.config and session.config.restart then return end
			-- dapui.close()
		end
		dap.listeners.before.event_terminated["dapui_config"] = close_ui_smart
		dap.listeners.before.event_exited["dapui_config"] = close_ui_smart
	end,
}
