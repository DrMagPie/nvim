if exists("g:plugs['NERDTree']")
  nnoremap <C-b> <esc>:NERDTreeToggle <CR>
  inoremap <C-b> <esc>:NERDTreeToggle <CR> a
  let g:NERDTreeGitStatusIndicatorMapCustom = {
                  \ 'Modified'  :'✹',
                  \ 'Staged'    :'✚',
                  \ 'Untracked' :'✭',
                  \ 'Renamed'   :'➜',
                  \ 'Unmerged'  :'═',
                  \ 'Deleted'   :'✖',
                  \ 'Dirty'     :'✗',
                  \ 'Ignored'   :'☒',
                  \ 'Clean'     :'✔︎',
                  \ 'Unknown'   :'?',
                  \ }

endif