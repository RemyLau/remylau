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

return require("packer").startup {
    function(use)
        -- Package Manager
        use 'wbthomason/packer.nvim'
        use 'williamboman/mason.nvim'

        -- Required plugins
        use 'nvim-lua/plenary.nvim'

        -- Interface
        use {
            'nvim-lualine/lualine.nvim',
            -- Note: need to setup nerd-font first (https://github.com/ryanoasis/nerd-fonts)
            -- After installing nerd-font, make sure the update terminal text
            -- settings to enable it for non-ascii chars (https://stackoverflow.com/questions/72899162)
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use 'tpope/vim-fugitive'

        -- File management
        use 'scrooloose/nerdtree'
        use {
            'tiagofumo/vim-nerdtree-syntax-highlight',
            requires = { 'ryanoasis/vim-devicons' }
        }

        -- Color scheme
        use 'folke/tokyonight.nvim'
        use 'folke/todo-comments.nvim'
        use { 'pineapplegiant/spaceduck', branch = 'main' }
        use 'rebelot/kanagawa.nvim'
        use { 'rose-pine/neovim', as = 'rose-pine' }

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
        use 'williamboman/mason-lspconfig.nvim'

        -- Powertools
        use 'nvim-telescope/telescope.nvim'
        use 'ThePrimeagen/harpoon'
        use 'mbbill/undotree'
        use {
            'natecraddock/sessions.nvim',
            config = function() require 'sessions'.setup() end
        }
        use 'folke/trouble.nvim'
    end
}
