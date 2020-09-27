if exists("g:plugs['codi.vim']")
  " Change the color
  " highlight CodiVirtualText guifg=cyan
  highlight CodiVirtualText guifg='#98C379'
  let g:codi#virtual_text_prefix = "❯ "
  let g:codi#aliases = {'javascript.jsx': 'javascript',}
endif
