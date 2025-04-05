return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
  {"nvimdev/indentmini.nvim", opts = { }, },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
			return { transparent = vim.g.transparent_enabled }
		end,
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },

  "xiyaowong/transparent.nvim",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-cmdline",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
}
