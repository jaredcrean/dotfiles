vim.cmd[[function s:AddTerminalNavigation()

    echom &filetype
    if &filetype ==# ''
        tnoremap <buffer> <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
        tnoremap <buffer> <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
        tnoremap <buffer> <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
        tnoremap <buffer> <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
    endif

endfunction

augroup TerminalNavigation
    autocmd!
    autocmd TermEnter * call s:AddTerminalNavigation()
augroup END
]]
