return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').register {
      ['<leader><tab>'] = { name = '[Tab]page', _ = 'which_key_ignore' },
    }
  end,
  cond = function()
    return not vim.g.vscode
  end,
}
