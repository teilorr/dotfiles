return {
  { "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  }
}
