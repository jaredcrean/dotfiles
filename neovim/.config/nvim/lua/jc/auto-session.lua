require('auto-session').setup {
    auto_session_suppress_dirs = {'~/', '~/Projects'},
    log_level = 'error',
    auto_session_enable_last_session = true,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    -- the configs below are lua only
    bypass_session_save_file_types = nil
 }
