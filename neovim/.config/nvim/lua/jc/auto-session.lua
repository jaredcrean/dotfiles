require('auto-session').setup {
    auto_session_suppress_dirs = {'~/', '~/Projects'},
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil
 }
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
