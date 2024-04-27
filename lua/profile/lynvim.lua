require("config.vimopt")
require("config.keymap")

--~ Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

--~ Configure `lazy.nvim` plugins
require('lazy').setup({
  --~ Auto detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  --~ NeoVim colorscheme
  require 'plugin.theme',

  --~ Neo-Tree file explorer
  require 'plugin.neo-tree',

  --~ Keybinding cheatsheet
  require 'plugin.which-key',

  --~ Markdown peek
  require 'plugin.peek',
})
