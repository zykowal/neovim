return {
	{
		"neovim/nvim-lspconfig",
		ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		opts = {
			servers = {
				clangd = {
					keys = {
						{ "<leader>lw", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
					},
					root_markers = {
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac", -- AutoTools
						"Makefile",
						"configure.ac",
						"configure.in",
						"config.h.in",
						"meson.build",
						"meson_options.txt",
						"build.ninja",
						".git",
					},
					capabilities = {
						offsetEncoding = "utf-8",
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						clangdFileStatus = true,
					},
				},
			},
		},
	},

	-- Treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = { ensure_installed = { "cpp" } },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = { ensure_installed = { "clangd" } },
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = { ensure_installed = { "clangd", "clang-format", "codelldb" } },
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
		},
	},
}
