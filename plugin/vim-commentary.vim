if exists("g:plugs['vim-commentary']")
  function! Comment()
    if (mode() == "n" )
      execute "Commentary"
    else
      execute "'<,'>Commentary"
    endif
  endfunction
  vnoremap <silent> <space>/ :call Comment()
endif
