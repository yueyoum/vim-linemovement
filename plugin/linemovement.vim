" linemovement.vim  Simplify the line movement
" Author            Wang Chao <yueyoum@gmail.com>
" Started           2013-03-23
" Updated           2013-03-23
" Version           0.1.0


if exists("g:loaded_linemovement") || &cp
    finish
endif
let g:load_linemovement = 1


function! linemovement#MoveBlockUp() range
    call linemovement#MoveBlock(a:firstline, a:lastline, a:firstline-2)
endfunction


function! linemovement#MoveBlockDown() range
    call linemovement#MoveBlock(a:firstline, a:lastline, a:lastline+1)
endfunction


function! linemovement#MoveBlock(startline, endline, new_line_pos)
    let s:cmd = a:startline . ',' . a:endline . ' move ' . a:new_line_pos
    execute s:cmd
    execute "normal! gv"
endfunction



" Moving block
vnoremap <silent> <c-s-k> :call linemovement#MoveBlockUp()<CR>
vnoremap <silent> <c-s-j> :call linemovement#MoveBlockDown()<CR>

" Moving one line
nnoremap <silent> <c-s-j> :m+1<CR>
nnoremap <silent> <c-s-k> :m-2<CR>
inoremap <silent> <c-s-j> <ESC>:m+1<CR>gi
inoremap <silent> <c-s-k> <ESC>:m-2<CR>gi


" Add empty line of above and bellow of one line
noremap <silent> <c-s-o> O<ESC>jo<ESC>k



