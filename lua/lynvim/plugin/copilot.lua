return {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    {
      'github/copilot.vim',
      config = function()
        vim.keymap.set('n', '<leader>hy', '<cmd>Copilot enable<cr>', { desc = '[Y] Enable Copilot' })
        vim.keymap.set('n', '<leader>hn', '<cmd>Copilot disable<cr>', { desc = '[N] Disable Copilot' })
        vim.keymap.set('n', '<leader>hs', '<cmd>Copilot status<cr>', { desc = 'Copilot [S]tatus' })

        vim.g.copilot_enabled = false
      end,
    },
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('CopilotChat').setup {
      question_header = '  User ',
      answer_header = '  Copilot ',
      error_header = '  Error ',
      mappings = {
        close = {
          normal = '<C-q>',
          insert = '<C-q>',
        },
        reset = {
          normal = '<C-x>',
          insert = '<C-x>',
        },
      },
    }

    vim.keymap.set('n', '<leader>hc', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle [C]hat' })
    vim.keymap.set('n', '<leader>hf', '<cmd>CopilotChatFixDiagnostic<cr>', { desc = '[F]ix Diagnostic' })
  end,
}
