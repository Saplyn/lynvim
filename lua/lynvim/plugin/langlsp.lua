--~ Language support: Language server protocal
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- Lua LSP config for Neovim config & apis
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Code quick navigation, <C-t> to jump back
        map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('n', 'gy', require('telescope.builtin').lsp_type_definitions, '[G]oto T[y]pe Definition')
        map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')

        -- Fuzzy find all the symbols in current document
        -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in current workspace
        -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Refactor: rename variable
        map({ 'n', 'v' }, '<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')

        -- Execute a code action: apply quick fix or suggestion
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Cursor hover highlight references
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Code completion support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Ensure enabled LSP & config
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    local servers = {
      -- C/C++
      clangd = {},
      -- gopls = {},
      -- pyright = {},

      -- Rust
      rust_analyzer = {},

      -- TOML
      taplo = {},

      -- TypeScript
      tsserver = {},

      -- Lua
      lua_ls = {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    -- Ensure installed tools
    local tools = {
      -- Spell check
      'cspell',

      -- Lua
      'stylua', -- formatter

      -- Markdown
      'markdownlint', -- linter
    }

    -- Ensure the servers and tools above are installed
    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, tools or {})
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
