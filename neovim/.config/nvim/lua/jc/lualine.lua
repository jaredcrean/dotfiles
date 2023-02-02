require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'material-nvim',
    -- theme = 'tokyonight',
--    theme = 'gruvbox-baby',
    theme = "catppuccin",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
--    lualine_c = {'filename'},
--    lualine_c = {{require('auto-session-library').current_session_name}},
      -- {
      -- 'filename',
      -- file_status = true, -- displays file status (readonly status, modified status)
      -- path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      -- },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
