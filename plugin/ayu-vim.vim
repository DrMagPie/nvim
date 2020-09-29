if exists("g:plugs['ayu-vim']")
  colorscheme ayu
  " let ayucolor="light"  " for light version of theme
  let ayucolor="mirage" " for mirage version of theme
  " let ayucolor="dark"   " for dark version of theme
  if exists("g:plugs['vim-airline']")
    let g:airline_theme = 'ayu'
  endif
endif
