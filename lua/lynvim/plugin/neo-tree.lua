--~ Neo-Tree file explorer
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- image support in preview window
  },
  config = function()
    vim.keymap.set('n', '<leader>e', function()
      require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
    end, { desc = 'NeoTree [E]xplorer (cwd)' })

    require('neo-tree').setup {
      window = {
        mappings = {
          ['<space>'] = 'none',
        },
      },
    }
  end,
}
