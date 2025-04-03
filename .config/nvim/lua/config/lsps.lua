require("mason-lspconfig").setup()
require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["pyright"].setup { capabilities = capabilities }
require("lspconfig")["clangd"].setup { capabilities = capabilities }
require("lspconfig")["lua_ls"].setup { capabilities = capabilities }


local lspconfig = require("lspconfig")

-- pyright
lspconfig.pyright.setup({
  filetype = { "python" },
})

-- lua_ls
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = { "LuaJIT" },
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      }
    }
  }
})
