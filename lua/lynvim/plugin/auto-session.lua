return {
  'rmagatti/auto-session',
  config = function()
    vim.keymap.set('n', '<leader>qr', '<cmd>SessionRestore<cr>', { desc = '[R]estore Session' })
    vim.keymap.set('n', '<leader>qs', '<cmd>SessionSave<cr>', { desc = '[S]ave Session' })

    require('auto-session').setup {
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
    }
  end,
}
