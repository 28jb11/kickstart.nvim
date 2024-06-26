return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = { 'c', 'lua', 'html', 'go', 'css', 'json' },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      ignore_install = {},
      auto_install = true,
      modules = {},
    }
  end,
}
