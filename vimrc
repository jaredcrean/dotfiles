"┌─────────────────────────────────────────────────────────────────────────────┐
"│                                                                             │
"│   mmm    mm   mmmmm  mmmmmm mmmm     m     mmmm         m    m mmmmm  m    m│
"│     #    ##   #   "# #      #   "m   #    #"   "        "m  m"   #    ##  ##│
"│     #   #  #  #mmmm" #mmmmm #    #        "#mmm          #  #    #    # ## #│
"│     #   #mm#  #   "m #      #    #            "#         "mm"    #    # "" #│
"│ "mmm"  #    # #    " #mmmmm #mmm"         "mmm#"          ##   mm#mm  #    #│
"│                                                                             │
"│                                                                             │
"└─────────────────────────────────────────────────────────────────────────────┘

set encoding=utf-8
syntax enable
syntax on
"colorscheme solarized
"colorscheme SpaceVim
colorscheme gruvbox
"colorscheme onedark
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"set term=screen-256color
"set t_Co=256
set background=dark
set encoding=utf-8
set history=10000
set hidden
set nornu
set wildmode=longest,list,full
set wildmenu
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)
set complete+=kspell
set timeoutlen=1000 ttimeoutlen=0
set splitright
set backup
set writebackup
set noswapfile
set undofile
set undolevels=1500
set directory=$HOME/.vim/tmp/swp//
set undodir=$HOME/.vim/tmp/undo//
"set backupskip=~/.vim/tmp/backup//
set backupdir=$HOME/.vim/tmp/backup//
set history=1000
set undolevels=1000
set undoreload=10000
set incsearch
set hlsearch
set nocompatible              " be iMproved, required
set shiftwidth=4
set clipboard=unnamedplus
set bs=2
set modifiable
set ts=4
set cursorline
"set expandtab
set colorcolumn=80
set updatetime=250
set scrolloff=10
set ffs=unix
"setting this for kitty terminal

let &t_ut=''

set linebreak

filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly


" Spell checking
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.wiki setlocal spell

"filetype plugin on          " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'gmarik/Vundle.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-grepper'
Plug 'morhetz/gruvbox'
Plug 'mattn/calendar-vim'
"Plug 'nvie/vim-flake8'
Plug 'shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
"Plun 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
"Plug 'vadv/vim-chef'
"Plun 'garbas/vim-snipmate'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/limelight.vim'
Plug 'ryuzee/neocomplcache_php_selenium_snippet'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'mbbill/undotree'
Plug 'rking/ag.vim'
Plug 'fisadev/vim-isort'
call plug#end()

let python_highlight_all=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping my leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PowerLine Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open on the right of screen
let g:NERDTreeWinPos = "left"
nmap <silent> <C-D> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let g:NERDTreeWinSize = 38
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MarkDown Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vim_markdown_folding_disabled=0
let g:vim_markdown_folding_style_pythonic = 1
"let g:vim_markdown_fenced_languages = ['python', 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remae keys to standered vim bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"RainbowParentheses config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']']]

"List of colors that you do not want. ANSI code or #RRGGBB
"let g:rainbow#blacklist = [233, 234]
autocmd VimEnter * RainbowParentheses

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           AutoComplete Configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Neocomplete
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Jedi VIM settings      
let g:jedi#force_py_version = 3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" VimWiki settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Set the dir of the wiki this can be more then one in the forme of a dic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Nextcloud/documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

au BufRead,BufNewFile *.md set filetype=vimwiki
let g:vimwiki_folding='list'

let g:vimwiki_global_ext = 0
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'ruby': 'ruby'}

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:autocmd FileType vimwiki map c :call ToggleCalendar()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            Syntax Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_auto_jump = 1
"let g:syntastic_mode_map = { 'mode': 'passive',     
"                          \ 'active_filetypes': [],     
"                          \ 'passive_filetypes': [] } 
"let g:syntastic_chef_checkers = ['foodcritic']
"let g:syntastic_chef_foodcritic_args = "-I ~/.chef/foodcritic"
"let g:syntastic_ruby_checkers = ['rubocop']
""let g:syntastic_ruby_rubocop_exec = '/opt/chefdk/embedded/ruby /opt/chefdk/embedded/bin/rubocop'

"""             Set file types
autocmd BufNewFile,BufRead */templates/*/*.erb set filetype=eruby.chef
autocmd BufNewFile,BufRead */metadata.rb set filetype=ruby.chef
autocmd BufNewFile,BufReadPost *.json set filetype=json
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"""""   HIT F7 to insert date in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <F7> <C-R>=strftime("\*%a %d %b %Y %H %M\*")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Run python code in vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <buffer> <F9> :exec 'w !python' shellescape(@%, 1)<cr>
"noremap <F5> <ESC>:w<CR>:silent execute "!python %"<CR><CR>
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>

" FZF commands and mappings
"#nnoremap <C-b> :Buffers<CR>
nnoremap <C-a> :Ag<CR>
nnoremap <C-p> :Files <CR>
nnoremap / :BLines<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepper
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:grepper       = {}
let g:grepper.tools = ['grep', 'git', 'rg']

nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ripgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m

"
"this will hopefully set nerdtree and Ctrlp to current working dir
let g:NERDTreeChDirMode       = 2
"let g:ctrlp_working_path_mode = 'c'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"           Snipets configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#disable_runtime_snippets = 0
let g:neosnippet#snippets_directory= '~/.vim/bundle/vim-snippets/snippets'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      VIM AIRLINE SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'wombat'

"Gundo
nnoremap <F6> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore .git --ignore build-out --ignore build-opt --ignore build-dbg -g ""'

endif

let g:ag_working_path_mode="r"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ansible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

"
"undotree
"
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

nnoremap <F5> :UndotreeToggle<cr>
