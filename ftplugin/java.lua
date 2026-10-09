local ok, jdtls = pcall(require, "jdtls")
if not ok then return end

local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"

local root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then return end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local os_config = "config_mac_arm"
if vim.fn.has("mac") == 1 and vim.fn.system("uname -m"):find("arm") == nil then
	os_config = "config_mac"
elseif vim.fn.has("unix") == 1 and vim.fn.has("mac") == 0 then
	os_config = "config_linux"
end

local bundles = {}
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
		"\n"
	)
)
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(mason_packages .. "/java-test/extension/server/*.jar", true), "\n")
)
bundles = vim.tbl_filter(function(path) return path ~= "" end, bundles)

local lombok_jar = mason_packages .. "/jdtls/lombok.jar"

local config = {
	cmd = {
		mason_packages .. "/jdtls/bin/jdtls",
		"--jvm-arg=-javaagent:" .. lombok_jar,
		"-configuration",
		mason_packages .. "/jdtls/" .. os_config,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {
			signatureHelp = { enabled = true },
			configuration = { updateBuildConfiguration = "interactive" },
		},
	},
	init_options = {
		bundles = bundles,
	},
	on_attach = function(_, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()

		local dap = require("dap")
		dap.configurations.java = dap.configurations.java or {}

		local function has_config(name)
			for _, cfg in ipairs(dap.configurations.java) do
				if cfg.name == name then return true end
			end
			return false
		end

		local function add_config(cfg)
			if not has_config(cfg.name) then table.insert(dap.configurations.java, 1, cfg) end
		end

		local function read_file(path)
			local f = io.open(path, "r")
			if not f then return "" end
			local content = f:read("*a")
			f:close()
			return content
		end

		local build_content = read_file(root_dir .. "/pom.xml") .. read_file(root_dir .. "/build.gradle")
			.. read_file(root_dir .. "/build.gradle.kts")

		if build_content:find("quarkus", 1, true) then
			add_config({
				type = "java",
				request = "attach",
				name = "Attach to quarkus:dev (localhost:5005)",
				hostName = "127.0.0.1",
				port = 5005,
			})
		elseif build_content:find("spring%-boot") or build_content:find("springframework.boot", 1, true) then
			add_config({
				type = "java",
				request = "attach",
				name = "Attach to Spring Boot (localhost:5006)",
				hostName = "127.0.0.1",
				port = 5006,
			})
		end

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "Java: " .. desc })
		end
		map("<leader>jo", jdtls.organize_imports, "[O]rganize imports")
		map("<leader>jv", jdtls.extract_variable, "Extract [V]ariable")
		map("<leader>jc", jdtls.extract_constant, "Extract [C]onstant")
		map("<leader>jt", jdtls.test_class, "[T]est class")
		map("<leader>jn", jdtls.test_nearest_method, "Test [N]earest method")
	end,
}

jdtls.start_or_attach(config)
