local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands

--vim.g.mapleader = ' '
--vim.g.maplocalleader = '|'

set.mouse = 'r'
set.background = 'dark'
set.cursorline = true
--vim.opt.hidden = true
set.wrap = false
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.termguicolors = true
set.clipboard = set.clipboard + "unnamedplus" -- copy & paste
set.timeoutlen = 300

if root then
	set.shada = '' -- Don't create root-owned files.
	set.shadafile = 'NONE'
else
	local backup_dir = vim.fn.expand('~/.cache/nvim')
	set.backup = true -- make backups before writing
	set.undofile = true -- persistent undos - undo after you re-open the file
	set.writebackup = true -- Make backup before overwriting the current buffer
	set.backupcopy = 'yes' -- Overwrite the original backup file
	set.directory = backup_dir .. '/swap' -- directory to place swap files in
	set.backupdir = backup_dir .. '/backedUP' -- where to put backup files
	set.undodir = backup_dir .. '/undos' -- where to put undo files
	set.viewdir = backup_dir .. '/view' -- where to store files for :mkview
	set.shada = "'100,<50,f50,n~/.cache/nvim/shada/shada"
end

-- Set for nvim-cmp
vim.completeopt = { menu,menuone,noselect, }

vim.g.diagnostic_icons = {
  Error = '',
  Warning = '',
  Information = '',
  Hint = 'ﴞ',
  Other = '',
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

 -- highlight on yank
exec([[
	augroup YankHighlight
		autocmd!
    	autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
	augroup end
]], false)
