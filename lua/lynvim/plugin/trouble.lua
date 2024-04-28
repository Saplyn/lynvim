return {
  'folke/trouble.nvim',
  branch = 'dev', -- IMPORTANT!
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>t',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[T]rouble: Diagnostics',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Trouble: [X] Buffer Diagnostics',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Trouble: [C]ode [S]ymbols',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Trouble: [L]SP Definitions / references / ...',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Trouble: Location [L]ist',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Trouble: [Q]uickfix List',
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
