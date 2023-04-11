-- require('auto-session').setup {
--     auto_session_suppress_dirs = {'~/', '~/Projects'},
--     log_level = 'error',
--     auto_session_enable_last_session = true,
--     auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
--     auto_session_enabled = true,
--     auto_save_enabled = true,
--     auto_restore_enabled = true,
--     -- the configs below are lua only
--     bypass_session_save_file_types = nil
--  }

-- Fix for neotree issues
local function close_neo_tree()
  require 'neo-tree.sources.manager'.close_all()
  vim.notify('closed all')
end

local function open_neo_tree()
  vim.notify('opening neotree')
  require 'neo-tree.sources.manager'.show('filesystem')
end

require 'auto-session'.setup {
  auto_session_create_enabled = false,
  --auto_session_enable_last_session = true,
  auto_save_enabled = true,
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_restore_enabled = true,
  auto_session_use_git_branch = true,
  bypass_session_save_file_types = { "neo-tree" },
  pre_save_cmds = {
    close_neo_tree,
  },
  post_restore_cmds = {
    open_neo_tree,
  }
}
