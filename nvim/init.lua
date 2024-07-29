require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
      vim.cmd("silent !black --quiet %")
      vim.cmd("edit")
    end,
  }
)

vim.api.nvim_set_keymap("n", "<c-s>", ":w<CR>", { noremap = true, silent = true })
