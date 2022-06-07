local get_hex = require('cokeline/utils').get_hex

local green = vim.g.terminal_color_2
local yellow = vim.g.terminal_color_3

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('ColorColumn', 'bg')
         or get_hex('Normal', 'fg')
    end,
    bg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('ColorColumn', 'bg')
    end,
  },

  sidebar = {
    filetype = 'neo-tree',
    components = {
      {
        text = 'neo-tree',
        fg = yellow,
        bg = get_hex('neo-tree', 'bg'),
        style = 'bold',
      },
    }
  },

  components = {
    {
      text = '｜',
      fg = function(buffer)
        return
          buffer.is_modified and yellow or green
      end
    },
    {
      text = function(buffer) return buffer.devicon.icon .. ' ' end,
      fg = function(buffer) return buffer.devicon.color end,
    },
    {
      text = function(buffer) return buffer.index .. ': ' end,
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      fg = get_hex('Comment', 'fg'),
      style = 'italic',
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
      style = function(buffer) return buffer.is_focused and 'bold' or nil end,
    },
    {
      text = ' ',
    },
  },
})
