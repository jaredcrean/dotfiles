local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Make Y only copy to end of line
keymap("n", "Y", "y$", opts)

-- Keep cursor centered when jumping and joining
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

vim.cmd([[
  packadd vim-tmux-navigator
  nnoremap <silent><c-h> <cmd>TmuxNavigateLeft<cr>
  nnoremap <silent><c-j> <cmd>TmuxNavigateDown<cr>
  nnoremap <silent><c-k> <cmd>TmuxNavigateUp<cr>
  nnoremap <silent><c-l> <cmd>TmuxNavigateRight<cr>

  tnoremap <c-h> <C-\><C-N><cmd>TmuxNavigateLeft<cr>
  tnoremap <c-j> <C-\><C-N><cmd>TmuxNavigateDown<cr>
  tnoremap <c-k> <C-\><C-N><cmd>TmuxNavigateUp<cr>
  tnoremap <c-l> <C-\><C-N><cmd>TmuxNavigateRight<cr>
]])

vim.cmd([[
  packadd better-vim-tmux-resizer
  let g:tmux_resizer_no_mappings = 1
  nnoremap <silent> <m-h> <cmd>TmuxResizeLeft<cr>
  nnoremap <silent> <m-j> <cmd>TmuxResizeDown<cr>
  nnoremap <silent> <m-k> <cmd>TmuxResizeUp<cr>
  nnoremap <silent> <m-l> <cmd>TmuxResizeRight<cr>
]])
