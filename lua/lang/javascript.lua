if true then
	return {}
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				vtsls = {
					settings = {
						typescript = {
							updateImportsOnFileMove = { enabled = "always" },
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "all" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = true },
							},
						},
						javascript = {
							updateImportsOnFileMove = { enabled = "always" },
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = true },
							},
						},
						vtsls = {
							enableMoveToFileCodeAction = true,
						},
					},
				},
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = { ensure_installed = { "javascript", "typescript", "tsx", "json" } },
	},

	{
		"mason-org/mason-lspconfig.nvim",
		optional = true,
		opts = { ensure_installed = { "vtsls" } },
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = { ensure_installed = { "vtsls", "prettierd", "oxlint" } },
	},

	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = function(_, opts)
			opts.linters_by_ft = opts.linters_by_ft or {}
			opts.linters_by_ft.javascript = { "oxlint" }
			opts.linters_by_ft.typescript = { "oxlint" }
			opts.linters_by_ft.javascriptreact = { "oxlint" }
			opts.linters_by_ft.typescriptreact = { "oxlint" }
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd", lsp_format = "fallback" },
				typescript = { "prettierd", lsp_format = "fallback" },
				javascriptreact = { "prettierd", lsp_format = "fallback" },
				typescriptreact = { "prettierd", lsp_format = "fallback" },
				json = { "prettierd", lsp_format = "fallback" },
			},
		},
	},
}
