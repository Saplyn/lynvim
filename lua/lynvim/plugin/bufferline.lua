return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        mode = 'tabs',
        diagnostics_indicator = function(_, _, diag)
          local icons = vim.g.diagnostics_signs
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
      },
    }
  end,
}
