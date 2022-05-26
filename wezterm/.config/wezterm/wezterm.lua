local wezterm = require 'wezterm';
--Themes


-- Better Pane navigation like tmux with vim plugin
local os = require("os")

local move_around = function(window, pane, direction_wez, direction_nvim)
  local result = os.execute("env NVIM_LISTEN_ADDRESS=/tmp/nvim" .. pane:pane_id() ..  " wezterm.nvim.navigator " .. direction_nvim)
  if result then
		window:perform_action(wezterm.action({ SendString = "\x17" .. direction_nvim }), pane)
  else
		window:perform_action(wezterm.action({ ActivatePaneDirection = direction_wez }), pane)
  end
end

wezterm.on("move-left", function(window, pane)
	move_around(window, pane, "Left", "h")
end)

wezterm.on("move-right", function(window, pane)
	move_around(window, pane, "Right", "l")
end)

wezterm.on("move-up", function(window, pane)
	move_around(window, pane, "Up", "k")
end)

wezterm.on("move-down", function(window, pane)
	move_around(window, pane, "Down", "j")
end)

return {
  -- color_scheme = "tokyonight_storm",
  color_scheme = "Gruvbox Dark",
  -- font = wezterm.font("Source Code Pro", {weight="Semibold"}),
  window_background_image = "/home/jcrean/Pictures/Wallpapers/VJsznPD.jpeg",
  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.05,

    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,

    -- You can adjust the saturation also.
    saturation = 1.0,
  },
  scrollback_lines = 10000,
  font_antialias = "Subpixel", -- None, Greyscale, Subpixel
  font_hinting = "Full",  -- None, Vertical, VerticalSubpixel, Full
  font_size = 11,
  font = wezterm.font("Hasklug Nerd Font"),
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.

  leader = { key="b", mods="CTRL" },
  hide_tab_bar_if_only_one_tab = true,
  keys = {
    { key = "a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
    { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = '"', mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "%", mods = "LEADER|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "v", mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "o", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
--    { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
--    { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
--    { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
--    { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
--    { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
--    { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
--    { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
--    { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
    { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "d", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "n", mods = "LEADER",       action=wezterm.action{ActivateTabRelative=1}},
    { key = "N", mods = "LEADER|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},


    -- pane move(vim aware)
    { key = "h", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-left" }) },
    { key = "l", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-right" }) },
    { key = "k", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-up" }) },
    { key = "j", mods = "CTRL", action = wezterm.action({ EmitEvent = "move-down" }) },


    -- Vim aware pane resize
    { key = "h", mods = "ALT", action = wezterm.action({ EmitEvent = "resize-left" }) },
    { key = "l", mods = "ALT", action = wezterm.action({ EmitEvent = "resize-right" }) },
    { key = "k", mods = "ALT", action = wezterm.action({ EmitEvent = "resize-up" }) },
    { key = "j", mods = "ALT", action = wezterm.action({ EmitEvent = "resize-down" }) },

  },
}