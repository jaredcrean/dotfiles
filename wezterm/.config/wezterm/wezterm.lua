local wezterm = require 'wezterm'

local cfg = {}

local misc_config = {

  scrollback_lines = 10000,
  -- Font Settings
  font_size = 14,
  font_dirs = {"~/Library/Fonts"},
  -- freetype_load_target = 'Light',
  freetype_render_target = 'HorizontalLcd',
  font = wezterm.font {
    family = 'Hasklug Nerd Font Mono',
    weight=500,
    stretch='Normal',
    style='Normal',
--    harfbuzz_features = { 'zero' },
  },
  selection_word_boundary = " \t\n{}[]()\"'`,;:@│*",
  color_scheme = 'Gruvbox dark, pale (base16)',
  cursor_blink_rate = 1000,
  front_end = 'WebGpu',
  -- animation_fps = 10,
  -- default_cursor_style = 'BlinkingBlock',
  -- term = 'xterm-256color',
  unzoom_on_switch_pane = true,
  use_fancy_tab_bar = false,
  quick_select_patterns = { '[0-9a-f]{7,40}', '\'.*\'', "\".*\"", },

  -- unix_domains = { { name = 'desktop', } },

  -- mouse_bindings = { { event = { Down = { streak = 3, button = 'Left' } }, action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone', mods = 'NONE', }, },
  default_gui_startup_args = {'connect', 'desktop'},
}

local mytable = require "lib/mystdlib".mytable
local full_config = mytable.merge_all(
  misc_config,
  require("apperance"),
  -- require("ssh-domains"),
  -- require("domains"),
  require("key-maps"),
  {} -- so the last table can have an ending comma for git diffs :)
)

return full_config
