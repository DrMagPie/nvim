" auto-install vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  " Plug 'tpope/vim-commentary'                                               " Better Comments
  Plug 'tpope/vim-speeddating'                                              " Change dates fast
  Plug 'glts/vim-radical'                                                   " Convert binary, hex, etc..
  Plug 'tpope/vim-repeat'                                                   " Repeat stuff
  Plug 'unblevable/quick-scope'                                             " Text Navigation
  Plug 'suy/vim-context-commentstring'                                      " Useful for React Commenting
  " Plug 'RRethy/vim-illuminate'                                            " highlight all matches under cursor
  if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion'                                       " Easy motion for VSCode
    Plug 'machakann/vim-highlightedyank'
  else
    Plug 'christianchiarulli/nvcode.vim'                                    " Themes
    " Plug 'jacoborus/tender.vim'                                             " Theme
    Plug 'tomasr/molokai'                                                   " Theme

    Plug 'justinmk/vim-sneak'                                               " Sneak
    Plug 'tpope/vim-surround'                                               " Surround
    Plug 'tpope/vim-eunuch'                                                 " Files
    Plug 'airblade/vim-rooter'                                              " Have the file system follow you around
    Plug 'tpope/vim-sleuth'                                                 " auto set indent settings
    " Plug 'nvim-treesitter/nvim-treesitter'                                  " Better Syntax Support
    Plug 'sheerun/vim-polyglot'                                             " Better Syntax Support
    Plug 'ryanoasis/vim-devicons'                                           " Cool Icons
    Plug 'jiangmiao/auto-pairs'                                             " Auto pairs for '(' '[' '{'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " Code of Completion Intellisense
    Plug 'liuchengxu/vista.vim'                                             " Vista View and search LSP symbols, tags in Vim/NeoVim.
    Plug 'metakirby5/codi.vim', {'on': 'Codi'}                              " Interactive code

    Plug 'vim-airline/vim-airline'                                          " Status Line
    " Plug 'vim-airline/vim-airline-themes'                                   " Status Line Themes
    " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}                         " Ranger
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                     " FZF
    Plug 'junegunn/fzf.vim'                                                 " FZF
    Plug 'airblade/vim-gitgutter'                                           " Git
    Plug 'tpope/vim-fugitive'                                               " Git
    Plug 'tpope/vim-rhubarb'                                                " Git
    Plug 'junegunn/gv.vim'                                                  " Git
    Plug 'rhysd/git-messenger.vim'                                          " Git
    Plug 'voldikss/vim-floaterm'                                            " Terminal
    Plug 'mhinz/vim-startify'                                               " Start Screen
    Plug 'liuchengxu/vim-which-key'                                         " See what keys do like in emacs
    Plug 'junegunn/goyo.vim'                                                " Zen mode
    Plug 'honza/vim-snippets'                                               " Snippets
    " Plug 'mattn/emmet-vim'                                                  " Snippets
    " Plug 'puremourning/vimspector'                                        " Debugging
    Plug 'mg979/vim-xtabline'                                               " Better tabline
    Plug 'mbbill/undotree'                                                  " undo time travel
    " Plug 'AndrewRadev/tagalong.vim'                                         " Auto change html tags
    Plug 'psliwka/vim-smoothie'                                             " Smooth scroll
    Plug 'skywind3000/asynctasks.vim'                                       " async tasks
    Plug 'skywind3000/asyncrun.vim'                                         " async tasks
    " Plug 'wesQ3/vim-windowswap'                                             " Swap windows
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }  " Markdown Preview
    Plug 'mattn/vim-gist'                                                   " Easily Create Gists
    Plug 'mattn/webapi-vim'                                                 " Easily Create Gists
    Plug 'norcalli/nvim-colorizer.lua'                                      " Colorizer
    " Plug 'luochen1990/rainbow'                                            " Rainbow brackets
    " Plug 'dense-analysis/ale'                                             " Async Linting Engine " TODO make config
    Plug 'ntpeters/vim-better-whitespace'                                   " Better Whitespace
    Plug 'vimwiki/vimwiki'                                                  " Vim Wiki

    " ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD===
  endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Automatically load configs for enabled plugins on startup
" for f in split(glob('~/.config/nvim/plugins/config/*.vim'), '\n')
"     exe 'source' f
" endfor

" for plugin in keys(g:plugs)
"   let plugCfg = join(["~/.config/nvim/plugins/config/",plugin,".vim"],'')
"   if !empty(glob(plugCfg))
"     :execute 'source '.fnameescape(plugCfg)
"   endif
" endfor
