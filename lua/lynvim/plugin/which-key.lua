--~ Keybinding cheatsheet
return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').register {
      ['<leader><tab>'] = { name = '[Tab]page', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = '[X] Trouble', _ = 'which_key_ignore' },
      ['<leader>q'] = { name = '[Q] Session', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = '[M]anage Plugin', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = '[H] Copilot', _ = 'which_key_ignore' },
    }
  end,
}
