
" Keymaps
nnoremap <C-;> <esc:set relativenumber! <CR>
nnoremap <C-s> <esc>:w <CR>
nnoremap <C-q> <esc>:q <CR>
nnoremap <C-_> <esc>:Commentary<CR>
nnoremap <C-z> <esc> u
nnoremap <C-v> P

inoremap <C-;> <esc>:set relativenumber! <CR> a
inoremap <C-s> <esc>:w <CR> a
inoremap <C-q> <esc>:q <CR>
inoremap <C-_> <esc>:Commentary<CR> a
inoremap <C-z> <esc> u a
inoremap <C-v> <esc> p a

vnoremap <C-x> d
vnoremap <C-c> y
vnoremap <C-v> p
vnoremap <C-z> u


" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")


nnoremap <C-Q> :wq!<CR> " Alternate way to quit
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>" " <TAB>: completion.

" " I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>




