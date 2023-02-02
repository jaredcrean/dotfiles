require('reach').setup({
  notifications = true
})

 local moptions = {
    filter = function(mark)
      return mark:match('[a-zA-Z]') -- return true to disable
   end,
 }

local boptions = {
    handle = 'auto',               -- 'bufnr' or 'dynamic' or 'auto'
    show_icons = true,
    show_current = false,         -- Include current buffer in the list
    show_modified = true,         -- Show buffer modified indicator
    modified_icon = '⬤',           -- Character to use as modified indicator
    grayout_current = true,        -- Wheter to gray out current buffer entry
    force_delete = {},            -- List of filetypes / buftypes to use
                                  -- 'bdelete!' on, e.g. { 'terminal' }
    filter = nil,                 -- Function taking bufnr as parameter,
                                  -- returning true or false
    sort = nil,                   -- Comparator function (bufnr, bufnr) -> bool
    terminal_char = '\\',         -- Character to use for terminal buffer handles
                                  -- when options.handle is 'dynamic'
    grayout = true,               -- Gray out non matching entries
    auto_exclude_handles = {},    -- A list of characters not to use as handles when
                                  -- options.handle == 'auto', e.g. { '8', '9', 'j', 'k' }
    previous = {
      enable = true,              -- Mark last used buffers with specified chars and colors
      depth = 2,                  -- Maximum number of buffers to mark
      chars = { '•' },            -- Characters to use as markers,
                                  -- last one is used when depth > #chars
      groups = {                  -- Highlight groups for markers,
        'String',                  -- last one is used when depth > #groups
        'Comment',
      },
    },
  }

require('reach').marks(moptions)
require('reach').buffers(boptions)
