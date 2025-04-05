vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
  "BufWritePre", {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
      vim.cmd("silent !black --quiet %")
      vim.cmd("edit")
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufEnter", {
    callback = function()
      vim.cmd("TSEnable highlight")
    end,
  }
)
