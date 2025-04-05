return {
  "simonmclean/triptych.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "antosha417/nvim-lsp-file-operations"
  },
  keys = {
    { "<leader>-", ":Triptych<CR>" },
    { "<C-n>",     ":Triptych<CR>" },
  },
  opts = {
    options = {
      line_numbers = { relative = true },
    }
  },
}
