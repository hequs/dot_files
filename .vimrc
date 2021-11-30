" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Add numbers to each line on the left-hand side.
set number

" Turn syntax highlighting on.
syntax on

" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4
" Use space characters instead of tabs.
set expandtab

" Smart autoindenting when starting a new line
set smartindent
" Copy indent from current line when starting a new line
set autoindent

" Highlighting search results
set hlsearch

" Enhanced command complition (see :h<tab>)
set wildmenu
set wcm=<TAB>


" Install color scheme
if empty(glob('~/.vim/colors/wombat256mod.vim'))
    silent !curl -fLo ~/.vim/colors/wombat256mod.vim --create-dirs https://raw.githubusercontent.com/michalbachowski/vim-wombat256mod/master/colors/wombat256mod.vim
endif
colorscheme wombat256mod


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Mappings
if mapcheck("<F2>") == ""
    map <F2> :NERDTreeToggle<CR>
    map! <F2> <ESC>:NERDTreeToggle<CR>
endif
