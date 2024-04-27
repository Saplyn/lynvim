--~ <ECS> disable highlight search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--~ Split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Go to Left Split' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Go to Lower Split' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Go to Upper Split' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Go to Right Split' })

--~ Tab navigation
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "[L]ast Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "[F]irst Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New [Tab]" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "[D] Close Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "[N]ext Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "[P]revious Tab" })

--~ Move lines
vim.keymap.set("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move Line Down" })
vim.keymap.set("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move Line Up" })
vim.keymap.set("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move Line Down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move Line Up" })

--~ Quality of life
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Lossless [P]aste" } )
