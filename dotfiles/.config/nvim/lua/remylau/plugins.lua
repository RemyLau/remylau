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

return require('packer').startup {
    function(use)
        -- Package Manager
        use 'wbthomason/packer.nvim'

        -- Required plugins
        use 'nvim-lua/plenary.nvim'

        -- Interface
        use 'nvim-tree/nvim-web-devicons'
        use {
            'nvim-lualine/lualine.nvim',
            -- Note: need to setup nerd-font first (https://github.com/ryanoasis/nerd-fonts)
            -- After installing nerd-font, make sure the update terminal text
            -- settings to enable it for non-ascii chars (https://stackoverflow.com/questions/72899162)
            -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use 'onsails/lspkind.nvim'

        -- Git related
        use 'APZelos/blamer.nvim'
        use 'lewis6991/gitsigns.nvim'
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
        use 'marko-cerovac/material.nvim'
        use { 'catppuccin/nvim', as = 'catppuccin' }

        -- Editing
        use 'Vimjas/vim-python-pep8-indent'
        use 'jiangmiao/auto-pairs'
        use 'numToStr/Comment.nvim'

        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
        use 'lukas-reineke/indent-blankline.nvim'

        -- Tree sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
            -- Run the line below instead of the above for first time installation
            -- run = function() Prequire('nvim-treesitter.install').update({ with_sync = true }) end
        }
        use 'p00f/nvim-ts-rainbow'
        use 'nvim-treesitter/playground'
        use 'nvim-treesitter/nvim-treesitter-context'

        -- LSP
        use 'neovim/nvim-lspconfig'
        use {
            'williamboman/mason.nvim',
            run = ':MasonUpdate',
        }
        use 'williamboman/mason-lspconfig.nvim'
        use 'jose-elias-alvarez/null-ls.nvim'           -- use nvim as lsp to inject diagnostics, etc.
        use 'jayp0521/mason-null-ls.nvim'

        -- Completion
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'
        -- vsnip
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        -- Powertools
        use 'nvim-telescope/telescope.nvim'
        use 'ThePrimeagen/harpoon'
        use 'mbbill/undotree'
        use {
            'natecraddock/sessions.nvim',
            config = function() Prequire('sessions').setup() end
        }
        use 'folke/trouble.nvim'

        -- Terminal
        use {
            'akinsho/toggleterm.nvim',
            tag = '*',
            config = function()
                Prequire('toggleterm').setup()
            end,
        }

        -- AI powered
        -- use 'github/copilot.vim'
        use {
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
            config = Prequire("remylau.special_config.copilot"),
        }
        -- use {
        --     "zbirenbaum/copilot-cmp",
        --     after = { "copilot.lua" },
        --     config = function () Prequire("copilot_cmp").setup() end
        -- }
        use 'AndreM222/copilot-lualine'
        -- use {
        --   'jackMort/ChatGPT.nvim',
        --   config = function() Prequire('chatgpt').setup() end,
        --   requires = {
        --     'MunifTanjim/nui.nvim',
        --     'nvim-lua/plenary.nvim',
        --     'nvim-telescope/telescope.nvim'
        --   }
        -- }

        -- Misc
        use {
            'folke/which-key.nvim',
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 1000
                Prequire('which-key').setup()
            end,
        }
    end
}
