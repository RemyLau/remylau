local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true  })
end

-- Movements
map('n', 'n', 'nzzzv')                      -- move to next matched keeping view centered
map('n', 'N', 'Nzzzv')
map('n', '{', '{zzzv')
map('n', '}', '}zzzv')
map('n', ')', ')zzzv')
map('n', '(', '(zzzv')
map('i', '<C-e>', '<ESC>A')                 -- mimic shell movements go to begining of line
map('i', '<C-a>', '<ESC>I')                 -- mimic shell movements go to begining of line

-- Editing
map('n', 'Y', 'yg$')
map('n', '<Leader>fe', ':vsplit|vertical resize 40|Ex<CR>')
map('n', '<Leader>+', ':vertical resize +5<CR>')
map('n', '<Leader>-', ':vertical resize -5<CR>')
map('n', '<Leader><CR>', ':source ~/.config/nvim/init.lua<CR>')
map('i', '<C-[>', '<Esc><Esc>')             -- by pass modifier and exit quickly

-- Buffer and tabs
map('n', '<C-j>', ':bnext<CR>')             -- next buffer
map('n', '<C-k>', ':bprevious<CR>')         -- previous buffer
-- map('n', '<C-x>', ':bp|bd#<CR>')            -- delete buffer without closing panel
map('n', '<C-l>', ':tabnext<CR>')           -- next tab
map('n', '<C-h>', ':tabprevious<CR>')       -- previous tab
map('n', '<C-t>', ':tabnew<CR>')            -- new tab
map('n', '<C-x>', ':tabclose<CR>')          -- close current tab
map('n', '<Leader>1', '1gt')                -- go to the first tab
map('n', '<Leader>2', '2gt')
map('n', '<Leader>3', '3gt')
map('n', '<Leader>4', '4gt')
map('n', '<Leader>5', '5gt')
map('n', '<Leader>6', '6gt')
map('n', '<Leader>7', '7gt')
map('n', '<Leader>8', '8gt')
map('n', '<Leader>9', '9gt')

-- Terminal
map('n', '<Leader>t', ':terminal<CR>')

-- Quick fix list
map('n', '<C-n>', ':cnext<CR>zzzv')         -- move to the next item
map('n', '<C-a>', ':cprevious<CR>zzzv')     -- move to the previous item
map('n', '<C-q>', ':cclose<CR>')            -- close quick fix list
