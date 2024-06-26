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
    end, { desc = 'File [E]xplorer (NeoTree)' })

    vim.keymap.set('n', '<leader>g', function()
      require('neo-tree.command').execute { toggle = true, source = 'git_status' }
    end, { desc = '[G]it Explorer (NeoTree)' })

    require('neo-tree').setup {
      auto_clean_after_session_restore = true,
      window = {
        mappings = {
          ['<space>'] = 'none',
          ['.'] = 'none',
          ['^'] = 'set_root',
          ['t'] = 'open',
          ['<tab>'] = 'open_tabnew',
          ['<cr>'] = 'open_tabnew',
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = '✖', -- this can only be used in the git_status source
            renamed = '󰁕', -- this can only be used in the git_status source
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '󱈸',
          },
        },
      },
    }
  end,
}
