return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  depedencies = {
    { "nvim-lua/plenary.nvim" },
    { "BurntSushi/ripgrep" },
  },
  event = "VeryLazy",
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-e>"] = { "<Esc>", type = "command" },
            ["<C-u>"] = false,
          },
          n = {
            ["q"] = actions.close
          }
        },
      },
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
    })
  end,
}
