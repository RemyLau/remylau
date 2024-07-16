local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

local mkcd = function(mode) -- mode: `cd`, `lcd`, `tcd`
    return function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
        local cmd = string.format("%s %s", mode, dir)
        require("telescope.actions").close(prompt_bufnr)
        print(cmd)
        vim.cmd(cmd)
    end
end

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false, -- clear prompt
                ["<C-.>"] = layout.toggle_preview,
                -- Cycle previewer for git commits to show full message
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
                ["<C-.>"] = layout.toggle_preview,
            },
        },
        preview = {
            filesize_limit = 10, -- ignores files bigger than filesize_limit MB
        }
    },
    pickers = {
        find_files = {
            mappings = {
                n = {
                    -- Change directory
                    ["cd"] = mkcd("cd"), -- global
                    ["lcd"] = mkcd("lcd"), -- local
                    ["tcd"] = mkcd("tcd"), -- tab
                },
            },
        },
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = actions.delete_buffer, -- delete buffer
                },
            },
        },
    },
})
