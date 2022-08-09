-- Automatically install Packer if it is not installed yet
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print(string.format("Cloning packer to %s", install_path))
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print("Installation done, close and reopen Neovim.")
    vim.cmd("packadd packer.nvim")
end

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
            requires = { 'ryanoasis/vim-devicons' }
        }

        -- Color scheme
        use 'folke/tokyonight.nvim'

        -- Editing
        use 'Vimjas/vim-python-pep8-indent'
        use 'jiangmiao/auto-pairs'

        -- Tree sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
            -- Run the line below instead of the above for first time installation
            -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
        }
        use 'p00f/nvim-ts-rainbow'
        use 'nvim-treesitter/playground'
        use 'nvim-treesitter/nvim-treesitter-context'

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
