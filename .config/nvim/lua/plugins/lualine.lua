return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "tokyonight-night",
    },
    sections = {
      lualine_c = {
        {
          require('tmux-status').tmux_windows,
          cond = require('tmux-status').show,
          padding = { left = 3 },
        },
      },
      lualine_a = {
        {
          "filename",
          path = 1,
        }
      }
    }
  }
}
