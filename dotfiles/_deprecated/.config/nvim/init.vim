syntax on

set nocompatible
set showmatch

set tabstop=4       " width of a hard tabstop
set shiftwidth=4    " size of an indentation
set softtabstop=4   " make tab (in insert mode) insert a combination of spaces
set expandtab       " make tab key (in insert mode) insert spaces instead of tab characters
set smarttab        " meke the tab key insert spaces/tabs to go to the next indentation
set autoindent      " indent a new line the same amount as the line just typed
set smartindent

set relativenumber  " show relative line number to the current line
set number          " show current line number instead of 0

set hidden          " something about buffer, need to explore more
set noerrorbells    " turn off bell sound
set scrolloff=8     " start scrolling when 8 lines away from bottom (or top)
set colorcolumn=80  " color the 80th column

" Matching and searching
set ignorecase      " case insensitive
set smartcase       " once explicitly use uppercase, will no longer be case insensitive
set hlsearch        " highlight matching search pattern, do :noh to hide after
set incsearch       " highlihgt matching search pattern as the query is being typed in

set ttyfast         " speed up scrolling

set formatoptions-=o
set formatoptions+=r

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'tpope/vim-fugitive'
 Plug 'mbbill/undotree'
 Plug 'Vimjas/vim-python-pep8-indent'
 Plug 'jiangmiao/auto-pairs'
 Plug 'neovim/nvim-lspconfig'
 Plug 'b3nj5m1n/kommentary'

 " Telescope
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'

 " Harpoon
 Plug 'nvim-lua/plenary.nvim'
 Plug 'ThePrimeagen/harpoon'
call plug#end()
filetype plugin indent on

let mapleader = " "

" Airline settings
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Buffer and tabs
nnoremap <Leader>l :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>
nnoremap <C-x> :bdelete<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Commenting
vnoremap <Leader>c 0I# <Esc>

" Quickfix list
nnoremap <C-n> :cnext<CR>
nnoremap <C-a> :cprevious<CR>

" Telescope
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <Leader>ff :Telescope find_files<CR>
nnoremap <Leader>fg :Telescope live_grep<CR>
nnoremap <Leader>fb :Telescope buffers<CR>
nnoremap <Leader>fh :Telescope help_tags<CR>

nnoremap <Leader>fe :vsplit<CR>:vertical resize 30<CR>:Ex<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rs :vertical resize 100<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>fl :call Flake8()<CR>
nnoremap <Leader>ud :UndotreeToggle<CR>

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap } }zzzv
nnoremap { {zzzv

" Harpoon
nnoremap <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>hp :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <Leader><C-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <Leader><C-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <Leader><C-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <Leader><C-;> :lua require("harpoon.ui").nav_file(4)<CR>

lua << EOF
    opts = { noremap=true, silent=true }

    -- Use an on_attach function to only map to the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    require('lspconfig').pylsp.setup{
        on_attach = on_attach,
        autostart=false,
    }
EOF

set completeopt-=preview

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
