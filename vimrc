if has('gui_running')
  set background=dark
  colorscheme torte
  "set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ 25
  set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font\ 25
else
  set background=dark
  colorscheme molokai
endif

syntax on
set history=10000
set hidden
set nornu
set wildmode=longest,list,full
set wildmenu
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)
set complete+=kspell
" Fix for delayed ESC key
set timeoutlen=1000 ttimeoutlen=0

filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" This is set for editing files over the network
set nocp
set linebreak

" Spell checking
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.wiki setlocal spell

" search as you type
set incsearch
" highlight the searched words
set hlsearch
set nocompatible              " be iMproved, required
set shiftwidth=4
set clipboard=unnamedplus
set bs=2
set modifiable
set t_Co=256
set ts=4
set encoding=utf-8
set cursorline
set expandtab
set colorcolumn=80
"set mouse=a

filetype plugin on          " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'L9'
Plugin 'tpope/vim-speeddating'
Plugin 'kien/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'morhetz/gruvbox'
Plugin 'mattn/calendar-vim'
Plugin 'nvie/vim-flake8'
Plugin 'shougo/neocomplete.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'markcornick/vim-vagrant'
"Plugin 'garbas/vim-snipmate'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping my leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "move to next and previous tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader><F11> :tabNext<ENTER>

map <leader><F10> :tabprevious<ENTER>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PowerLine Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open on the right of screen
let g:NERDTreeWinPos = "right"
map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MarkDown Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=0
let g:vimwiki_folding='list'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remae keys to standered vim bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Remap ctrl n for buffernext and  ctrl p to bufferprevious
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"RainbowParentheses config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

"List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]
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
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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

"YouCompleteMe
"let g:ycm_python_binary_path = '/usr/bin/python3.5'
"let g:EclimCompletionMethod = 'omnifunc'
"let g:ycm_auto_trigger = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            Syntax Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',     
                          \ 'active_filetypes': [],     
                          \ 'passive_filetypes': [] } 

nnoremap <silent> <F3> :SyntasticCheck<CR>    
" Insert Date into file
inoremap <F4> <C-R>=strftime("\*%a %d %b %Y %H %M\*")<CR>

"Run python code in vim
nnoremap <buffer> <F9> :exec 'w !python' shellescape(@%, 1)<cr>
noremap <F5> <ESC>:w<CR>:silent execute "!python %"<CR><CR>
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" VimWiki settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Set the dir of the wiki this can be more then one in the forme of a dic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:vimwiki_list = [{'path': '$HOME/Nextcloud/documents/vimwiki'}]
let g:vimwiki_list = [{'path': '$HOME/Nextcloud/documents/vimwiki',
            \ 'syntax': 'markdown', 'ext': '.md'}]


au BufRead,BufNewFile *.md set filetype=vimwiki

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

    " Set up auto save to HTML
"      let g:vimwiki_list = [{'path': '~/Nextcloud/documents/vimwiki/', 'auto_export': 1}]
    " Update the TOC when saved
"      let g:vimwiki_list = [{'path': '~/Nextcloud/documents/vimwiki/', 'auto_toc': 1}]
"        :hi VimwikiHeader1 guifg=#FF0000
"        :hi VimwikiHeader2 guifg=#00FF00
"        :hi VimwikiHeader3 guifg=#0000FF
"        :hi VimwikiHeader4 guifg=#FF00FF
"        :hi VimwikiHeader5 guifg=#00FFFF
"        :hi VimwikiHeader6 guifg=#FFFF00
"Custome Template for HTML in Vimwiki
      
"let g:vimwiki_list = [{
"  \ 'path': '$HOME/Nextcloud/documents/vimwiki',
"  \ 'template_path': '$HOME/Nextcloud/documents/vimwiki/templates',
"  \ 'template_default': 'default',
"  \ 'template_ext': '.html'}]

      
" CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'/home/jcrean/dotfiles/vwtags.py'
          \ , 'ctagsargs': 'all'
          \ }


"Gundo
nnoremap <F5> :GundoToggle<CR>
set undodir=~/.vim/tmp/undo//
set undodir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=~/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

set undofile
set history=100
set undolevels=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

