-- Setup nvim-cmp.
local npairs = require('nvim-autopairs')
local Rule = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

npairs.setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {},
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
   },
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-- Rules Setup
-- Add spaces between parentheses
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col -1, opts.col)
      return vim.tbl_contains({ '()', '{}', '[]' }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
    end),
  Rule('', ' )')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ')' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(')'),
  Rule('', ' }')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == '}' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key('}'),
  Rule('', ' ]')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ']' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(']'),
}



--     offset = 0, -- Offset from pattern match
--     end_key = "$",
--     keys = "qwertyuiopzxcvbnmasdfghjkl",
--     check_comma = true,
--     -- highlight = "PmenuSel",
--     highlight = "Search",
--     highlight_grey = "Comment",
--   },
-- }
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
--cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
