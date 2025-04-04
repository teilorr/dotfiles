return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  depedencies = {
    { "nvim-lua/plenary.nvim" },
    { "BurntSushi/ripgrep" },
  },
  event = "VeryLazy",
  opts = {
    pickers = {
      find_files = {
        find_command = {
          "fd",
          "--hidden",
          "-E",
          "**/.git/*",
          "-E",
          "**/.venv/*",
          "-E",
          "**/__pycache__/*",
          "--type",
          "file",
          "--unrestricted",
        },
      },
    },
  }
}
