if true then
	return {}
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				basedpyright = {
					before_init = function(_, c)
						if not c.settings then
							c.settings = {}
						end
						if not c.settings.python then
							c.settings.python = {}
						end
						c.settings.python.pythonPath = vim.fn.exepath("python")
					end,
					settings = {
						basedpyright = {
							analysis = {
								typeCheckingMode = "basic",
								autoImportCompletions = true,
								diagnosticSeverityOverrides = {
									reportUnusedImport = "information",
									reportUnusedFunction = "information",
									reportUnusedVariable = "information",
									reportGeneralTypeIssues = "none",
									reportOptionalMemberAccess = "none",
									reportOptionalSubscript = "none",
									reportPrivateImportUsage = "none",
								},
							},
						},
					},
				},
				ruff = {
					cmd_env = { RUFF_TRACE = "messages" },
					init_options = {
						settings = {
							logLevel = "error",
						},
					},
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = { ensure_installed = { "python", "toml" } },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = { ensure_installed = { "ruff", "basedpyright", "taplo" } },
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = { ensure_installed = { "ruff", "basedpyright", "debugpy", "taplo" } },
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				python = { "ruff_organize_imports", "ruff_format", lsp_format = "fallback" },
				toml = { "taplo", "taplo_format", lsp_format = "fallback" },
			},
		},
	},

	{
		"linux-cultist/venv-selector.nvim",
		enabled = vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1 or vim.fn.executable("fd-find") == 1,
		keys = {
			{ "<Leader>lv", "<Cmd>VenvSelect<CR>", desc = "Select VirtualEnv" },
		},
		opts = {},
		cmd = "VenvSelect",
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		optional = true,
		opts = { ensure_installed = { "python" } },
	},

	-- Need lua5.1 and luarocks to build.
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	optional = true,
	-- 	specs = {
	-- 		{
	-- 			"mfussenegger/nvim-dap-python",
	-- 			dependencies = "mfussenegger/nvim-dap",
	-- 			ft = "python", -- NOTE: ft: lazy-load on filetype
	-- 			opts = {
	-- 				rocks = {
	-- 					hererocks = true,
	-- 				},
	-- 			},
	-- 			config = function(_, opts)
	-- 				local path = vim.fn.exepath("debugpy-adapter")
	-- 				if path == "" then
	-- 					path = vim.fn.exepath("python")
	-- 				end
	-- 				require("dap-python").setup(path, opts)
	-- 			end,
	-- 		},
	-- 	},
	-- },
}
