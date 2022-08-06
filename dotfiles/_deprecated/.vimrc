set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
" Plugin 'prabirshrestha/vim-lsp'
 Plugin 'ambv/black'
 Plugin 'nvie/vim-flake8'
 Plugin 'mbbill/undotree'
 Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4       " width of a hard tabstop
set shiftwidth=4    " size of an indentation
set softtabstop=4   " make tab (in insert mode) insert a combination of spaces
set expandtab       " make tab key (in insert mode) insert spaces instead of tab characters
set smarttab        " meke the tab key insert spaces/tabs to go to the next indentation

set relativenumber  " show relative line number to the current line
set number          " show current line number instead of 0

" Matching and searching
set ignorecase      " case insensitive
set smartcase       " once explicitly use uppercase, will no longer be case insensitive
set hlsearch        " highlight matching search pattern, do :noh to hide after
set incsearch       " highlihgt matching search pattern as the query is being typed in

set hidden          " something about buffer, need to explore more
set noerrorbells    " turn off bell sound
set scrolloff=8     " start scrolling when 8 lines away from bottom (or top)
set colorcolumn=80  " color the 80th column

set autoindent

let mapleader = " "

nnoremap <Leader>fe :vsplit<CR>:vertical resize 30<CR>:Ex<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rs :vertical resize 100<CR>
nnoremap <Leader><CR> :source ~/.vimrc<CR>
nnoremap <Leader>fl :call Flake8()<CR>
nnoremap <Leader>ud :UndotreeToggle<CR>
nnoremap <Leader>ls :LspStop<CR>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap } }zzzv
nnoremap { {zzzv

" python language server (pip install python-lsp-server[all])
" let g:lsc_server_commands = { 'python' : 'pyls' }

syntax on
