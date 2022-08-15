local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true  })
end

-- Movements
map('n', 'n', 'nzzzv')                      -- move to next matched keeping view centered
map('n', 'N', 'Nzzzv')
map('n', '}', '}zzzv')
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

-- Buffer and tabs
map('n', '<C-j>', ':bnext<CR>')             -- next buffer
map('n', '<C-k>', ':bprevious<CR>')         -- previous buffer
-- map('n', '<C-x>', ':bp|bd#<CR>')            -- delete buffer without closing panel
map('n', '<C-l>', ':tabnext<CR>')           -- next tab
map('n', '<C-h>', ':tabprevious<CR>')       -- previous tab
map('n', '<C-t>', ':tabnew<CR>')            -- new tab
map('n', '<C-x>', ':tabclose<CR>')          -- close current tab
map('n', '<Leader>l', ':e#<CR>')            -- go back to last (alternative) file
map('n', '<Leader>1', ':1b<CR>')            -- go to the first buffer
map('n', '<Leader>1', ':2b<CR>')
map('n', '<Leader>1', ':3b<CR>')
map('n', '<Leader>1', ':4b<CR>')
map('n', '<Leader>1', ':5b<CR>')
map('n', '<Leader>1', ':6b<CR>')
map('n', '<Leader>1', ':7b<CR>')
map('n', '<Leader>1', ':8b<CR>')
map('n', '<Leader>1', ':9b<CR>')

-- Quick fix list
map('n', '<C-n>', ':cnext<CR>')             -- move to the next item
map('n', '<C-a>', ':cprevious<CR>')         -- move to the previous item
map('n', '<C-q>', ':cclose<CR>')            -- close quick fix list
