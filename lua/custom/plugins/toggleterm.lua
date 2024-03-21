return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        persist_mode = false,
        float_opts = {
          border = 'shadow',
          width = 80,
          height = 10,
          row = 37,
          winblend = 5,
        },
      }
    end,
  },
  vim.keymap.set('n', '<leader>\\', ':ToggleTerm<CR>', { noremap = true, silent = true }),
}
