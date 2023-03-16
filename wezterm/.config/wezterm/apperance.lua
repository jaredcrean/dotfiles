local cfg = {}

-- cfg.hide_tab_bar_if_only_one_tab = true
local wezterm = require 'wezterm'

cfg.colors = require("colors")

-- local hostname=wezterm.hostname()

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--     local numpanes = ''
--     -- if (#tab.panes > 1) then numpanes = '(' .. tostring(#tab.panes) .. ') ' end
--     -- return numpanes .. tab.active_pane.title
--     return numpanes .. hostname .. working_directory
-- end)

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = basename(pane.foreground_process_name)
      .. ' '
      .. pane.pane_id
    local color = 'lightgreen'
    if tab.is_active then
      color = 'gray'
    end
    return {
      { Background = { Color = color } },
      { Text = ' ' .. title .. ' ' },
    }
  end
)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    if tab.is_active then
      return {
        { Background = { Color = 'lightblue' } },
        { Text = ' ' .. tab.active_pane.title .. ' ' },
      }
    end
    local has_unseen_output = false
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
    if has_unseen_output then
      return {
        { Background = { Color = 'Orange' } },
        { Text = ' ' .. tab.active_pane.title .. ' ' },
      }
    end
    return tab.active_pane.title
  end
)

-- format window title
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
    local numtabs = ''
    if (#tabs > 1) then numtabs = '(' .. tostring(#tabs) .. ') ' end
    -- return numtabs .. tab.active_pane.title .. " Wezterm"
    return numtabs .. " Wezterm"
end)

return cfg
