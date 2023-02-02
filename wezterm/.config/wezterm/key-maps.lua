local wezterm = require 'wezterm';
-- local act = wezterm.action
-- Better Pane navigation like tmux with vim plugin
local os = require("os")
local cfg = {}

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

-- Better pane resizing in wezterm and vim
local vim_resize = function(window, pane, direction_wez, direction_nvim)
	local result = os.execute(
		"env NVIM_LISTEN_ADDRESS=/tmp/nvim"
			.. pane:pane_id()
			.. " "
			.. "~/"
			.. "/bin/"
			.. "wezterm.nvim.navigator "
			.. direction_nvim
	)
	if result then
		window:perform_action(wezterm.action({ SendString = "\x1b" .. direction_nvim }), pane)
	else
		window:perform_action(wezterm.action({ ActivatePaneDirection = direction_wez }), pane)
	end
end

wezterm.on("resize-left", function(window, pane)
	vim_resize(window, pane, "Left", "h")
end)

wezterm.on("resize-right", function(window, pane)
	vim_resize(window, pane, "Right", "l")
end)

wezterm.on("resize-up", function(window, pane)
	vim_resize(window, pane, "Up", "k")
end)

wezterm.on("resize-down", function(window, pane)
	vim_resize(window, pane, "Down", "j")
end)

  -- Key Maps
cfg.leader = { key = 'b', mods='CTRL', timeout_miliseconds=1000 }
cfg.keys = {
  { key = 'mapped:"', mods = 'LEADER|SHIFT',  action=wezterm.action{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = 'mapped:%', mods = 'LEADER|SHIFT',  action=wezterm.action{SplitVertical={domain='CurrentPaneDomain'}}},
  { key = 'mapped:v', mods = 'LEADER',        action=wezterm.action{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = 'mapped:o', mods = 'LEADER',        action='TogglePaneZoomState'},
  { key = 'mapped:z', mods = 'LEADER',        action='TogglePaneZoomState'},
  { key = 'mapped:r', mods = 'LEADER|SHIFT',  action=wezterm.action{RotatePanes='Clockwise'}},
  { key = 'mapped:c', mods = 'LEADER',        action=wezterm.action{SpawnTab='CurrentPaneDomain'}},
  { key = 'mapped:1', mods = 'LEADER',        action=wezterm.action{ActivateTab=0}},
  { key = 'mapped:2', mods = 'LEADER',        action=wezterm.action{ActivateTab=1}},
  { key = 'mapped:3', mods = 'LEADER',        action=wezterm.action{ActivateTab=2}},
  { key = 'mapped:4', mods = 'LEADER',        action=wezterm.action{ActivateTab=3}},
  { key = 'mapped:5', mods = 'LEADER',        action=wezterm.action{ActivateTab=4}},
  { key = 'mapped:6', mods = 'LEADER',        action=wezterm.action{ActivateTab=5}},
  { key = 'mapped:7', mods = 'LEADER',        action=wezterm.action{ActivateTab=6}},
  { key = 'mapped:8', mods = 'LEADER',        action=wezterm.action{ActivateTab=7}},
  { key = 'mapped:9', mods = 'LEADER',        action=wezterm.action{ActivateTab=8}},
  { key = 'mapped:&', mods = 'LEADER|SHIFT',  action=wezterm.action{CloseCurrentTab={confirm=true}}},
  { key = 'mapped:d', mods = 'LEADER',        action=wezterm.action{CloseCurrentPane={confirm=true}}},
  { key = 'mapped:x', mods = 'LEADER',        action=wezterm.action{CloseCurrentPane={confirm=true}}},
  { key = 'mapped:n', mods = 'LEADER',        action=wezterm.action{ActivateTabRelative=1}},
  { key = 'mapped:N', mods = 'LEADER|SHIFT',  action=wezterm.action{ActivateTabRelative=-1}},
  { key = 'mapped:o', mods = 'LEADER|CTRL',        action=wezterm.action.ActivateLastTab},
  { key = 'mapped:UpArrow', mods = 'SHIFT',   action=wezterm.action{ScrollToPrompt=(-1)}},
  { key = 'mapped:DownArrow', mods = 'SHIFT', action=wezterm.action{ScrollToPrompt=(1)}},
  {
    key = 'r',
    mods = 'CTRL|CMD',
    action = wezterm.action.ReloadConfiguration,
  },
  -- { key = 'L', mods = 'CTRL',                 action=wezterm.action{ShowDebugOverlay }},
  -- { key = 'mapped:f', mods = 'CTRL|SHIFT', action=wezterm.action{}},
  -- { key = '9', mods = 'ALT',                 action=wezterm.action{ShowLauncherArgs { flags = 'FUZZY|TABS' }}},

  -- pane move(vim aware)
  { key = 'mapped:h', mods = 'CTRL', action=wezterm.action({ EmitEvent = 'move-left' })},
  { key = 'mapped:l', mods = 'CTRL', action=wezterm.action({ EmitEvent = 'move-right' })},
  { key = 'mapped:k', mods = 'CTRL', action=wezterm.action({ EmitEvent = 'move-up' })},
  { key = 'mapped:j', mods = 'CTRL', action=wezterm.action({ EmitEvent = 'move-down' })},

  -- Vim aware pane resize
  { key = 'mapped:h', mods = 'ALT', action=wezterm.action({ EmitEvent = 'resize-left' })},
  { key = 'mapped:l', mods = 'ALT', action=wezterm.action({ EmitEvent = 'resize-right' })},
  { key = 'mapped:k', mods = 'ALT', action=wezterm.action({ EmitEvent = 'resize-up' })},
  { key = 'mapped:j', mods = 'ALT', action=wezterm.action({ EmitEvent = 'resize-down' })},
}
cfg.key_tables = {
  search_mode = {
    {key = 'mapped:Enter', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    {key = 'mapped:Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    {key = 'mapped:n', mods = 'CTRL', action = wezterm.action.CopyMode 'NextMatch' },
    {key = 'mapped:p', mods = 'CTRL', action = wezterm.action.CopyMode 'PriorMatch' },
    {key = 'mapped:r', mods = 'CTRL', action = wezterm.action.CopyMode 'CycleMatchType' },
    {key = 'mapped:u', mods = 'CTRL', action = wezterm.action.CopyMode 'ClearPattern' },
    {key = 'mapped:PageUp', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatchPage' },
    {key = 'mapped:PageDown', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatchPage' },
    {key = 'mapped:UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    {key = 'mapped:DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatch' },
    {key = 'mapped:e', mods = 'CTRL', action = wezterm.action.CopyMode 'EditPattern' },
  },
}

return cfg
