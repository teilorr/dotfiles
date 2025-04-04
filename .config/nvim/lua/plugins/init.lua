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
    opts = { },
	},

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { },
  },

  "xiyaowong/transparent.nvim",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-cmdline",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
}
