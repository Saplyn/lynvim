return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
    { "<leader>qr", function() require("persistence").load() end, desc = "[R]estore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore [L]ast Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "[D]on't Save Current Session" },
  },
}
