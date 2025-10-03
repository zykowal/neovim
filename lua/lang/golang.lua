if true then
	return {}
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {
					settings = {
						gopls = {
							analyses = {
								ST1003 = true,
								fieldalignment = false,
								fillreturns = true,
								nilness = true,
								nonewvars = true,
								shadow = true,
								undeclaredname = true,
								unreachable = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							codelenses = {
								gc_details = false,
								generate = true, -- show the `go generate` lens.
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							buildFlags = { "-tags", "integration" },
							completeUnimported = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							gofumpt = true,
							matcher = "Fuzzy",
							semanticTokens = true,
							staticcheck = true,
							symbolMatcher = "fuzzy",
							usePlaceholders = true,
						},
					},
				},
			},
		},
	},

	-- Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = { ensure_installed = { "gopls" } },
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = {
			ensure_installed = { "delve", "gopls", "gomodifytags", "gotests", "iferr", "impl", "goimports", "gofumpt" },
		},
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofumpt", lsp_format = "last" },
			},
		},
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			if not require("lazy.core.config").spec.plugins["mason.nvim"] then
				vim.print("Installing go dependencies...")
				vim.cmd.GoInstallDeps()
			end
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "williamboman/mason.nvim", optional = true }, -- by default use Mason for go dependencies
		},
		opts = {},
	},

	{
		"echasnovski/mini.icons",
		optional = true,
		opts = {
			file = {
				[".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
			},
			filetype = {
				gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
			},
		},
	},

	-- Debug
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
			{
				"jay-babu/mason-nvim-dap.nvim",
				optional = true,
				opts = {
					ensure_installed = { "delve" },
				},
			},
		},
		opts = {},
	},

	-- Test
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"fredrikaverpil/neotest-golang",
		},
		opts = {
			adapters = {
				["neotest-golang"] = {
					-- Here we can set options for neotest-golang, e.g.
					-- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
					dap_go_enabled = true, -- requires leoluz/nvim-dap-go
				},
			},
		},
	},
}
