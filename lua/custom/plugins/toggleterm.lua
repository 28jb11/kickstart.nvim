return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        persist_mode = false,
        float_opts = {
          border = 'single',
          width = 80,
          height = 15,
          row = 37,
          winblend = 3,
          titlepos = 'center',
        },
        autochdir = true,
        hide_numbers = true,
        auto_scroll = true,
        -- set transparency
        shade_filetypes = {},
      }
    end,
  },
  vim.keymap.set('n', '<leader>\\', ':ToggleTerm<CR>', { noremap = true, silent = true }),
}
