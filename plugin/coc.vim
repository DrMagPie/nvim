if exists("g:plugs['coc.nvim']")
  let g:coc_global_extensions = [
    \ 'coc-sh',
    \ 'coc-snippets',
    \ 'coc-actions',
    \ 'coc-tasks',
    \ 'coc-pairs',
    \ 'coc-floaterm',
    \ 'coc-emoji',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-pyright',
    \ 'coc-explorer',
    \ 'coc-prettier',
    \ 'coc-vimlsp',
    \ 'coc-yank',
    \ 'coc-json',
    \ ] " https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
    " \ 'coc-xml',
    " \ 'coc-marketplace',
    " \ 'coc-svg',
    " \ 'coc-cssmodules',
    " \ 'coc-html',
    " \ 'coc-css',
    " \ 'coc-emmet',
    " \ 'coc-lists',

  nnoremap <C-b> <esc>:CocCommand explorer <CR>
  inoremap <C-b> <esc>:CocCommand explorer <CR> a
  "nmap <silent> <space>e :CocCommand explorer<CR>
  " nnoremap <silent> <leader>e :CocCommand explorer<CR>
  " nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=no
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  " nmap <leader>rn <Plug>(coc-rename)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current line.
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  " nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings using CoCList:
  " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr> " Show all diagnostics. " TODO add these to which key
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr> " Manage extensions.
  " nnoremap <silent> <space>c  :<C-u>CocList commands<cr> " Show commands.
  " nnoremap <silent> <space>o  :<C-u>CocList outline<cr> " Find symbol of current document.
  " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr> " Search workspace symbols.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR> " Do default action for next item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR> " Do default action for previous item.
  " nnoremap <silent> <space>p  :<C-u>CocListResume<CR> " Resume latest coc list.

  " Explorer
  let g:coc_explorer_global_presets = {
  \   'floating': {
  \      'position': 'floating',
  \   },
  \   'floatingLeftside': {
  \      'position': 'floating',
  \      'floating-position': 'left-center',
  \      'floating-width': 30,
  \   },
  \   'floatingRightside': {
  \      'position': 'floating',
  \      'floating-position': 'right-center',
  \      'floating-width': 30,
  \   },
  \   'simplify': {
  \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   }
  \ }

  " " Snippets
  " " Use <C-l> for trigger snippet expand.
  " imap <C-l> <Plug>(coc-snippets-expand)

  " " Use <C-j> for select text for visual placeholder of snippet.
  " vmap <C-j> <Plug>(coc-snippets-select)

  " " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  " let g:coc_snippet_next = '<c-j>'

  " " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  " let g:coc_snippet_prev = '<c-k>'

  " " Use <C-j> for both expand and jump (make expand higher priority.)
  " imap <C-j> <Plug>(coc-snippets-expand-jump)

  " " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)
endif
