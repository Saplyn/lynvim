--~ Language support: Completion
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build: regex support in snippets, remove cond below to enable on windows
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- A variety of premade snippets by `friendly-snippets`
        {
          'rafamadriz/friendly-snippets',
          config = function()
            -- require('luasnip.loaders.from_vscode').lazy_load())
            require('luasnip').filetype_extend('rust', { 'rustdoc' })
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- `:help ins-completion` for more insight
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Compeletion [n]ext item
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Compeletion [p]rev item

        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Sroll doc [b]ack
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Sroll doc [f]orward

        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept ([y]es) completion

        ['<C-Space>'] = cmp.mapping.complete {}, -- Manually trigger completion

        -- move to the right of each of the expansion locations
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        -- move to the left of each of the expansion locations
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
  cond = function()
    return not vim.g.vscode
  end,
}
