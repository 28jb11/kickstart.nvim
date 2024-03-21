return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'info',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
      auto_session_enabled = true,
      auto_session_last_session_dir = vim.fn.stdpath 'data' .. '/sessions/last_session',
      cwd_change_handling = {
        post_cwd_changed_hook = function()
          require('lualine').refresh()
        end,
      },
      -- close nvim-tree before saving session
      pre_save_cmds = {
        'NvimTreeClose',
      },
      -- close buffer NvimTree_1 before saving session
      pre_save_cmds_filter = function()
        local current_buf = vim.api.nvim_get_current_buf()
        return vim.api.nvim_buf_get_name(current_buf) ~= 'NvimTree_1'
      end,
    }
  end,
}
