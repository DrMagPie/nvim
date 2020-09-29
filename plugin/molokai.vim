if exists("g:plugs['molokai']")
  colorscheme molokai
  if exists("g:plugs['vim-airline-themes']")
    let g:airline_theme = 'molokai'
  endif
endif
