set nocompatible    " be iMproved, required
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

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap } }zzzv
nnoremap { {zzzv

syntax on
