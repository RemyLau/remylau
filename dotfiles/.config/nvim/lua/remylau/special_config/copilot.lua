return function()
    require("copilot").setup({
        panel = {
            enabled = true,
            -- enabled = false,  -- work with copilot-cmp
            auto_refresh = false,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<C-CR>" -- "<M-CR>"
            },
            layout = {
                position = "top", -- bottom | top | left | right
                ratio = 0.4
            },
        },
        suggestion = {
            -- enabled = true,
            enabled = true,  -- work with copilot-cmp
            auto_trigger = false,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = "<C-;>",
                prev = "<C-,>",
                dismiss = "<C-q>",
            },
        },
        filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
    })

    vim.cmd("Copilot disable") -- default offline, need to manually enable
end
