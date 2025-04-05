vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>",   { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-e>", "<Esc>",  { noremap = true, silent = true })
vim.keymap.set("i", "jj",    "<Esc>",  { noremap = true, silent = true })

local telescope = require("telescope.builtin")
local find_buffers = function()
  telescope.buffers({ sort_mru = true, ignore_current_buffer = true })
end

vim.keymap.set("n", "<c-p>", telescope.find_files, {})
vim.keymap.set("n", "<leader><Space>", telescope.oldfiles, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>b", find_buffers, {})
