vim.opt.mouse = 'r'
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.cursorline = true
--vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'

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
