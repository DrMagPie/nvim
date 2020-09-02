" auto-install vim-plug
if empty(glob("$HOME/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/plugged')
    Plug 'sheerun/vim-polyglot'                                               " Better Syntax Support
    Plug 'jiangmiao/auto-pairs'                                               " Auto pairs for '(' '[' '{'
    Plug 'tpope/vim-commentary'                                               " Better Comments
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                           " Code of Completion Intellisense
    " Plug 'jacoborus/tender.vim'                                               " Theme
    Plug 'tomasr/molokai'                                                     " Theme
    Plug 'vim-airline/vim-airline'                                            " Status Line
    Plug 'vim-airline/vim-airline-themes'                                     " Status Line Themes
    " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'psliwka/vim-smoothie'                                               " Smooth scroll
    Plug 'voldikss/vim-floaterm'                                               " Terminal
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'metakirby5/codi.vim', {'on': 'Codi'} 
    " Grave
    " Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}                       " File Explorer
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
    " Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
    " Plug 'ryanoasis/vim-devicons', {'on': 'NERDTreeToggle'}                   " Cool Icons
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Automatically load configs for enabled plugins on startup
for plugin in keys(g:plugs)
  let plugCfg = join(["~/.config/nvim/plugins/config/",plugin,".vim"],'')
  if !empty(glob(plugCfg))
    :execute 'source '.fnameescape(plugCfg)
  endif
endfor
