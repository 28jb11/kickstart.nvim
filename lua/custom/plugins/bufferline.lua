return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
        },
      }
    end,
  },
}
