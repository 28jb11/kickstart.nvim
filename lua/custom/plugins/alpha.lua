return {
  'goolord/alpha-nvim',
  event = 'VimEnter', -- load plugin after all configuration is set
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                ___-------___                         ]],
      [[                            _-~~             ~~-_                     ]],
      [[                         _-~                    /~-_                  ]],
      [[        /^\__/^\         /~  \                   /    \                ]],
      [[      /|  O|| O|        /      \_______________/        \              ]],
      [[     | |___||__|      /       /                \          \            ]],
      [[     |          \    /      /                    \          \          ]],
      [[     |   (_______) /______/                        \_________ \        ]],
      [[     |         / /         \                      /            \       ]],
      [[      \         \^\\         \                  /               \     ]],
      [[        \         ||           \______________/      _-_       //\    ]],
      [[          \       ||------_-~~-_ ------------- \ --/~   ~\    || __/  ]],
      [[            ~-----||====/~     |==================|       |/~~~~~     ]],
      [[             (_(__/  ./     /                    \_\      \.         ]],
      [[                    (_(___/                         \_____)_)        ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = 'center',
      hl = 'Type',
      -- wrap = "overflow";
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('R', '󰈚   Restore Session', ':SessionRestore<CR>'),
      dashboard.button('r', '󱣲   Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('c', '   Config', ':e $MYVIMRC <CR>'),
      dashboard.button('m', '󱌣   Mason', ':Mason<CR>'),
      dashboard.button('l', '󰒲   Lazy', ':Lazy<CR>'),
      dashboard.button('u', '󰂖   Update plugins', "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local count = (math.floor(stats.startuptime * 100) / 100)
        dashboard.section.footer.val = {
          '󱐌 ' .. stats.count .. ' plugins loaded in ' .. count .. ' ms',
          ' ',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
  vim.keymap.set('n', '<leader>;', ':Alpha<CR>', { silent = true }),
}
