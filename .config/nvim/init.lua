require("config.lazy")
require("config.lsps")

require("lazy").setup("plugins")

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-e>", "<Esc>",  { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj",    "<Esc>",  { noremap = true, silent = true} )

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<c-p>", telescope.find_files, {})
vim.keymap.set("n", "<leader><Space>", telescope.oldfiles, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
