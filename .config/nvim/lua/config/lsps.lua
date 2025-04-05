require("mason-lspconfig").setup()
require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig["pyright"].setup({ capabilities = capabilities })
lspconfig["clangd"].setup({ capabilities = capabilities })
lspconfig["lua_ls"].setup({ capabilities = capabilities })

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

local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc })
end


map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

local diagnostic = vim.diagnostic

diagnostic.config({
  underline = false,
  virtual_text = false,
  virtual_lines = false,
  severity_sort = true,
  float = {
    source = true,
    header = "Diagnostics:",
    prefix = " ",
    border = "single",
  },
})
map("<Leader>e", diagnostic.open_float, "Open diagnostic")
