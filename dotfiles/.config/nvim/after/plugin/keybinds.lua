local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true  })
end

local function mapi(m, k, v, istart, iend)
    -- Map ki to execute v with i, i default from 1 to 9
    -- Example: mapi('n', '<Leader>a', function(i) print('TEST', i) end)
    istart = istart or 1
    iend = iend or 9

    for i = istart, iend do
        local vbounded = function() v(i) end
        map(m, k .. i, vbounded)
    end
end

-- Mason
map('n', '<C-m>', '<Cmd>Mason<CR>')

-- Lsp
map('n', '<Leader>n', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<Leader>p', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')

-- Completion
map('n', '<Leader>cd', "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>")
map('n', '<Leader>ce', "<Cmd>lua require('cmp').setup.buffer { enabled = true }<CR>")
map('n', '<Leader>coe', "<Cmd>Copilot enable<CR>")
map('n', '<Leader>cod', "<Cmd>Copilot disable<CR>")

-- Undo tree
map('n', '<Leader>ud', '<Cmd>UndotreeToggle<CR>')

-- NERDTree
map('n', '<Leader>e', '<Cmd>NERDTree<CR>')
map('n', '<Leader>r', '<Cmd>NERDTreeFind<CR>')

-- Telescope
map('n', '<C-p>', '<Cmd>Telescope find_files<CR>')
map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>')
map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
map('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')
map('n', '<Leader>fd', '<Cmd>TodoTelescope<CR>') -- folke/todo-comments.nvim
map('n', '<Leader>fs', '<Cmd>Telescope grep_string<CR>')
-- map('n', '<Leader>fs', function()
--     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- Telescope - Treesitter Pickers
map('n', '<Leader>ft', '<Cmd>Telescope treesitter<CR>')
-- Telescope - LSP Pickers
map('n', '<Leader>ld', '<Cmd>Telescope diagnostic<CR>')
map('n', '<Leader>lr', '<Cmd>Telescope lsp_references<CR>')
map('n', '<Leader>ls', '<Cmd>Telescope lsp_document_symbols<CR>')
-- Telescope - Git Pickers
map('n', '<Leader>gg', '<Cmd>Telescope git_files<CR>')
map('n', '<Leader>gc', '<Cmd>Telescope git_commits<CR>')
map('n', '<Leader>gb', '<Cmd>Telescope git_branches<CR>')
map('n', '<Leader>gs', '<Cmd>Telescope git_status<CR>')
map('n', '<Leader>gh', '<Cmd>Telescope git_stash<CR>')

-- Harpoon
map('n', '<Leader>ha', '<Cmd>lua require("harpoon.mark").add_file()<CR>')
map('n', '<Leader>hp', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<Leader><C-j>', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<Leader><C-k>', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<Leader><C-l>', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<Leader><C-;>', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>')

-- Sessions
map('n', '<Leader>ss', [[
<Cmd>SessionsSave .local_nvim_session<CR>
<Cmd>SessionsStop<CR>
<Cmd>lua print "session saved to .local_nvim_session"<CR>
]]) -- save but not autosave
map('n', '<Leader>sl', [[
<Cmd>SessionsLoad .local_nvim_session<CR>
<Cmd>SessionsStop<CR>
<Cmd>lua print "session loaded from .local_nvim_session"<CR>
]]) -- load and disable autosave

-- Trouble
map('n', '<Leader>xx', '<Cmd>TroubleToggle<CR>')

-- Diffview
map('n', '<Leader>do', '<Cmd>DiffviewOpen<CR>')

-- Comment
map('n', '<C-/>', function()
    require("Comment.api").toggle.linewise.current()
end)  -- toggle comment current line
map('x', '<C-/>', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
end)  -- toggle comment current selected visual block

-- ToggleTerm
map('n', 'tt', '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
map('n', 'tf', '<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>')
map('n', 'tv', '<Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>')
map('n', 'th', '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>')
map('n', 'tb', '<Cmd>exe v:count1 . "ToggleTerm direction=tab"<CR>')
map('n', 'ta', '<Cmd>ToggleTermToggleAll<CR>')
