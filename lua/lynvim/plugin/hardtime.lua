-- lazy.nvim
return {
  'm4xshen/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>H', '<cmd>Hardtime toggle<cr>', { desc = 'Togle [H]ardtime.nvim' })

    require('hardtime').setup {
      max_count = 4,
      disable_mouse = false,
      disabled_filetypes = { 'qf', 'netrw', 'neo-tree', 'lazy', 'mason', 'NeoTree', 'help' },
    }
  end,
}
