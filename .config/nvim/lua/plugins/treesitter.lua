return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    return {
      ensure_installed = { "c", "python", "rust", "vim", "lua" },

      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true
      }
    }
  end
}
