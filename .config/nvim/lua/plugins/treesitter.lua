return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  opts =  {
    ensure_installed = { "c", "python", "rust", "vim", "lua" },

    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    }
  }
}
