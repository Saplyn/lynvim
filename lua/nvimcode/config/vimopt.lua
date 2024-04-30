--~ leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--~ Vim UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true -- highlight cursor current line

--~ Quality of life
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus' -- os clipboard sync
vim.opt.undofile = true -- president undo history
vim.opt.scrolloff = 10 -- scroll padding
vim.opt.laststatus = 2

--~ Better search and replace
vim.opt.ignorecase = true -- case-less search
vim.opt.smartcase = true -- case-matter search if `\C` or `[A-Z]`
vim.opt.inccommand = 'split' -- preview substitutions live
vim.opt.hlsearch = true
vim.opt.incsearch = true

--? Idonno but just leave it
vim.opt.updatetime = 250 -- less update time
vim.opt.timeoutlen = 300 -- less mapped seq wait time (which-key)
vim.opt.breakindent = true -- indent preserving

--~ Tab setting
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--~ Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('lyn-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
