return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
    return {
      options = {
        icons_enabled = true,
        theme = "tokyonight-night",
      },
      sections = {
        lualine_a = {
          {
            "filename",
            path = 1,
          }
        }
      }
    }
  end
}
