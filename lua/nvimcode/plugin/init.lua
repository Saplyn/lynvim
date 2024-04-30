return {
  --~ Auto detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  --~ Quick commenting
  -- n: `gcc` Line-comment toggle
  -- n: `gbc` Block-comment toggle
  -- n: 'gcO' Add comment on the line above
  -- n: 'gco' Add comment on the line below
  -- n: 'gcA' Add comment at the end of line
  { 'numToStr/Comment.nvim', opts = {} },
}
