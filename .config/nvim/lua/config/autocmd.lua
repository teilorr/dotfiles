vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
  "BufWritePre", {
    group = "AutoFormat",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter", {
    callback = function()
      vim.cmd("TSEnable highlight")
    end,
  }
)
