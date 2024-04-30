return {
  'echasnovski/mini.nvim',
  config = function()
    -- n: `va)`  [V]isually select [A]round [)]paren
    -- n: `yinq` [Y]ank [I]nside [N]ext [']quote
    -- n: `ci'`  [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- n: `saiw)`  [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- n: `sd'`    [S]urround [D]elete [']quotes
    -- n: `sr)'`   [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
}
