return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
              s = s .. n .. sym
            end
            return s
          end,
          color_icons = true,
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Directory',
              text_align = 'left',
              separator = true,
            },
          },
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          always_show_bufferline = true,
          sort_by = 'extension',
          indicator = {
            style = 'underline',
          },
          themable = true,
          numbers = 'ordinal',
          truncate_names = true,
          tab_size = 18,
          custom_areas = {
            right = function()
              local result = {}
              local seve = vim.diagnostic.severity
              local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
              local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
              local info = #vim.diagnostic.get(0, { severity = seve.INFO })
              local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

              if error ~= 0 then
                table.insert(result, { text = '  ' .. error, fg = '#EC5241' })
              end

              if warning ~= 0 then
                table.insert(result, { text = '  ' .. warning, fg = '#EFB839' })
              end

              if hint ~= 0 then
                table.insert(result, { text = '  ' .. hint, fg = '#A3BA5E' })
              end

              if info ~= 0 then
                table.insert(result, { text = '  ' .. info, fg = '#7EA9A7' })
              end
              return result
            end,
          },
        },
      }
    end,
  },

  -- Move to the previous/next buffer
  vim.keymap.set('n', '<Leader>bb', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true }),
  vim.keymap.set('n', '<Leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true }),

  -- Close the current buffer
  vim.keymap.set('n', '<Leader>bc', ':bd<CR>', { noremap = true, silent = true }),

  -- Move the current buffer left or right
  vim.keymap.set('n', '<Leader>bB', ':BufferLineMovePrev<CR>', { noremap = true, silent = true }),
  vim.keymap.set('n', '<Leader>bN', ':BufferLineMoveNext<CR>', { noremap = true, silent = true }),

  -- Pick a buffer directly
  vim.keymap.set('n', '<Leader>bf', ':BufferLinePick<CR>', { noremap = true, silent = true }),
}
