--~ Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Go to Left Split' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Go to Lower Split' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Go to Upper Split' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Go to Right Split' })

--~ Tab navigation
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

