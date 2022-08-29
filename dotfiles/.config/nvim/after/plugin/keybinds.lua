local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true  })
end

-- Lsp
map('n', '<Leader>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<Leader>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- Undo tree
map('n', '<Leader>ud', ':UndotreeToggle<CR>')

-- NERDTree
map('n', '<Leader>e', ':NERDTree<CR>')

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<Leader>ff', ':Telescope find_files<CR>')
map('n', '<Leader>fg', ':Telescope live_grep<CR>')
map('n', '<Leader>fb', ':Telescope buffers<CR>')
map('n', '<Leader>fh', ':Telescope help_tags<CR>')
map('n', '<Leader>fd', ':TodoTelescope<CR>') -- folke/todo-comments.nvim

-- Harpoon
map('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<Leader>hp', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<Leader><C-j>', ':lua require("harpoon.ui").nav_file(1)<CR>')
map('n', '<Leader><C-k>', ':lua require("harpoon.ui").nav_file(2)<CR>')
map('n', '<Leader><C-l>', ':lua require("harpoon.ui").nav_file(3)<CR>')
map('n', '<Leader><C-;>', ':lua require("harpoon.ui").nav_file(4)<CR>')

-- Sessions
map('n', '<Leader>ss', [[
:SessionsSave .local_nvim_session<CR>
:SessionsStop<CR>
:lua print "session saved to .local_nvim_session"<CR>
]]) -- save but not autosave
map('n', '<Leader>sl', [[
:SessionsLoad .local_nvim_session<CR>
:SessionsStop<CR>
:lua print "session loaded from .local_nvim_session"<CR>
]]) -- load and disable autosave
