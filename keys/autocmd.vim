autocmd FileType python nmap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR> 
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>