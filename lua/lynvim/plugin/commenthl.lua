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
  opts = {
    signs = false,
    keywords = {
      TODO = { icon = '󱅫 ', signs = true },
    },
  },
}
