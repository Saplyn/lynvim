--~ Comment highlight
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'Djancyp/better-comments.nvim',
      init = function()
        require('better-comment').Setup {
          default = false,
          tags = {
            { name = '/ ', fg = '#cccccc', bg = 'none', bold = false },
            { name = '~ ', fg = '#46d8a5', bg = 'none' },
            { name = '? ', fg = '#62a0ea', bg = 'none' },
          },
        }
      end,
    },
  },
  config = function()
    require('todo-comments').setup {
      signs = false,
      keywords = {
        FIX = { signs = true },
        WARN = { icon = '󱇎 ', signs = true },
        TODO = { icon = '󱅫 ', color = 'info', signs = true },
        LYN = { icon = '󰄛 ', color = 'hint', signs = true },
        NOTE = { icon = ' ', signs = true },
      },
    }

    vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = '[S]earch [T]odo' })
  end,
}
