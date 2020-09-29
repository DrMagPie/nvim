" auto-install vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'tpope/vim-commentary'                                             " Better Comments - https://github.com/tpope/vim-commentary
  Plug 'unblevable/quick-scope'                                           " Text Navigation - https://github.com/unblevable/quick-scope
  Plug 'justinmk/vim-sneak'                                               " Sneak - https://github.com/justinmk/vim-sneak
  Plug 'tpope/vim-sleuth'                                                 " auto set indent settings - https://github.com/tpope/vim-sleuth
  Plug 'sheerun/vim-polyglot'                                             " Better Syntax Support - https://github.com/sheerun/vim-polyglot
  Plug 'ryanoasis/vim-devicons'                                           " Cool Icons - https://github.com/ryanoasis/vim-devicons
  Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " Code of Completion Intellisense - https://github.com/neoclide/coc.nvim
  Plug 'liuchengxu/vista.vim'                                             " Vista View and search LSP symbols, tags in Vim/NeoVim. - https://github.com/liuchengxu/vista.vim
  " Plug 'metakirby5/codi.vim', {'on': 'Codi'}                              " Interactive code - https://github.com/metakirby5/codi.vim

  Plug 'vim-airline/vim-airline'                                          " Status Line - https://github.com/vim-airline/vim-airline
  " Plug 'vim-airline/vim-airline-themes'                                   " Status Line Themes - https://github.com/vim-airline/vim-airline-themes
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                     " FZF - https://github.com/junegunn/fzf
  Plug 'junegunn/fzf.vim'                                                 " FZF - https://github.com/junegunn/fzf.vim
  Plug 'tpope/vim-fugitive'                                               " Git - https://github.com/tpope/vim-fugitive
  Plug 'voldikss/vim-floaterm'                                            " Terminal - https://github.com/voldikss/vim-floaterm
  Plug 'mhinz/vim-startify'                                               " Start Screen - https://github.com/mhinz/vim-startify
  " Plug 'liuchengxu/vim-which-key'                                         " See what keys do like in emacs - https://github.com/liuchengxu/vim-which-key
  Plug 'junegunn/goyo.vim'                                                " Zen mode - https://github.com/junegunn/goyo.vim
  " Plug 'puremourning/vimspector'                                          " Debugging - https://github.com/puremourning/vimspector
  Plug 'mg979/vim-xtabline'                                               " Better tabline - https://github.com/mg979/vim-xtabline
  Plug 'psliwka/vim-smoothie'                                             " Smooth scroll - https://github.com/psliwka/vim-smoothie
  Plug 'skywind3000/asynctasks.vim'                                       " async tasks - https://github.com/skywind3000/asynctasks.vim
  Plug 'skywind3000/asyncrun.vim'                                         " async tasks - https://github.com/skywind3000/asyncrun.vim
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " Markdown Preview - https://github.com/iamcco/markdown-preview.nvim
  Plug 'ntpeters/vim-better-whitespace'                                   " Better Whitespace - https://github.com/ntpeters/vim-better-whitespace
  " Plug 'vimwiki/vimwiki'                                                  " Vim Wiki - https://github.com/vimwiki/vimwiki

  " ===THEMES=== ===THEMES=== ===THEMES=== ===THEMES=== ===THEMES=== ===THEMES===
  " Plug 'christianchiarulli/nvcode.vim'                                    " Themes
  " Plug 'jacoborus/tender.vim'                                             " Theme
  " Plug 'tomasr/molokai'                                                   " Theme
  " Plug 'ayu-theme/ayu-vim'                                                " Theme

  " ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD=== ===GRAVEYARD===
  " Plug 'luochen1990/rainbow'                                            " Rainbow brackets - https://github.com/luochen1990/rainbow
  " Plug 'dense-analysis/ale'                                             " Async Linting Engine " TODO make config - https://github.com/dense-analysis/ale
  " Plug 'easymotion/vim-easymotion'                                        " Easy motion - https://github.com/easymotion/vim-easymotion
  " Plug 'airblade/vim-rooter'                                              " Have the file system follow you around - https://github.com/airblade/vim-rooter
  " Plug 'nvim-treesitter/nvim-treesitter'                                  " Better Syntax Support - https://github.com/nvim-treesitter/nvim-treesitter
  " Plug 'jiangmiao/auto-pairs'                                             " replaced by coc-pairs " Auto pairs for '(' '[' '{' - https://github.com/jiangmiao/auto-pairs
  " Plug 'tpope/vim-repeat'                                                 " Repeat stuff - https://github.com/tpope/vim-repeat
  " Plug 'RRethy/vim-illuminate'                                            " highlight all matches under cursor - https://github.com/RRethy/vim-illuminate
  " Plug 'tpope/vim-surround'                                               " Surround - https://github.com/tpope/vim-surround
  " Plug 'tpope/vim-eunuch'                                                 " Files - https://github.com/tpope/vim-eunuch
  " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}                         " Ranger - https://github.com/kevinhwang91/rnvimr
  " Plug 'airblade/vim-gitgutter'                                           " Git - https://github.com/airblade/vim-gitgutter
  " Plug 'junegunn/gv.vim'                                                  " Git Requires vim-fugitive - https://github.com/junegunn/gv.vim
  " Plug 'tpope/vim-rhubarb'                                                " Git - https://github.com/tpope/vim-rhubarb
  " Plug 'rhysd/git-messenger.vim'                                          " Git - https://github.com/rhysd/git-messenger.vim
  " Plug 'mbbill/undotree'                                                  " undo time travel - https://github.com/mbbill/undotree
  " Plug 'honza/vim-snippets'                                               " Snippets - https://github.com/honza/vim-snippets
  " Plug 'norcalli/nvim-colorizer.lua'                                      " Colorizer - https://github.com/norcalli/nvim-colorizer.lua
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
