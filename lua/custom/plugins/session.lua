return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      auto_session_pre_save_cmds = { ':NvimTreeToggle' },
    }
  end,
}
