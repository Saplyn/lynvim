--~ Keybinding cheatsheet
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader><tab>', group = '[Tab]page' },
      { '<leader><tab>_', hidden = true },
      { '<leader>c', group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>h', group = '[H] Copilot' },
      { '<leader>h_', hidden = true },
      { '<leader>m', group = '[M]anage Plugin' },
      { '<leader>m_', hidden = true },
      { '<leader>q', group = '[Q] Session' },
      { '<leader>q_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>x', group = '[X] Trouble' },
      { '<leader>x_', hidden = true },
    }
  end,
}
