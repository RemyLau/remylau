-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require("packer").startup({
    function(use)
        -- Packer Manager
        use 'wbthomason/packer.nvim'

        -- Required plugins
        use 'nvim-lua/plenary.nvim'

        -- Interface
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use 'tpope/vim-fugitive'

        -- File management
        use 'scrooloose/nerdtree'
        use {
            'tiagofumo/vim-nerdtree-syntax-highlight',
            requires = { 'kyazdani42/nvim-web-devicons' }
        }

        -- Editing
        use 'Vimjas/vim-python-pep8-indent'
        use 'jiangmiao/auto-pairs'

        -- LSP
        use 'neovim/nvim-lspconfig'

        -- Undo tree
        use 'mbbill/undotree'

        -- Telescope
        use 'nvim-telescope/telescope.nvim'

        -- Harpoon
        use 'ThePrimeagen/harpoon'
    end
})
