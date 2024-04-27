return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'rust', 'toml' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Regex support highlighting languages
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- `:help nvim-treesitter`
    require('nvim-treesitter.configs').setup(opts)

    -- Treesitter modules
    --  Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --  Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --  Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
