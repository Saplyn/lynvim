--~ Markdown peek
return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    vim.api.nvim_create_user_command('PeekToggle', function()
      local peek = require 'peek'
      if peek.is_open() then
        peek.close()
      else
        peek.open()
      end
    end, {})

    vim.keymap.set('n', '<leader>cp', '<cmd>PeekToggle<cr>', { desc = '[C]ode [P]review Markdown (Peek)' })
  end,
}
