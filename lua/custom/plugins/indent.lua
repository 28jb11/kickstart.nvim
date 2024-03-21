local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local hooks = require 'ibl.hooks'
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local ibl = require 'ibl'
    ibl.setup {
      indent = {
        char = '▏',
        highlight = highlight,
        -- For tab_char and other indent configurations, see :help ibl.config.indent
      },
      exclude = {
        filetypes = { 'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble' },
        buftypes = { 'terminal', 'nofile' },
      },
      scope = {
        enabled = true, -- Enabled by default, adjust as needed
      },
      -- Add or adjust other configurations as needed
    }

    -- Update highlight groups based on :help ibl.highlights
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    -- Continue for other highlights as needed
  end,
}
