return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
			return { transparent = vim.g.transparent_enabled }
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		init = function()
			require("nvim-tree").setup()
		end,
	},
	"xiyaowong/transparent.nvim",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

}
