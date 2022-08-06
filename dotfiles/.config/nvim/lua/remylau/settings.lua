local g = vim.g
local o = vim.o

-- Editing
o.tabstop = 4               -- width of a hard tabstop
o.shiftwidth = 4            -- size of an indentation
o.softtabstop = -1          -- use shiftwidth value if -1
o.expandtab = true          -- make tab key (in insert mode) insert spaces instead of tab characters
o.smarttab = true           -- meke the tab key insert spaces/tabs to go to the next indentation
o.autoindent = true         -- indent a new line the same amount as the line just typed
o.smartindent = true
-- o.formatoptions -= o
-- o.formatoptions += r
o.showmatch = true

-- Editor UI
o.relativenumber = true     -- show relative line number to the current line
o.number = true             -- show current line number instead of 0
o.cursorline = true         -- underline the current cursor line
o.hidden = true             -- something about buffer, need to explore more
o.wrap = false              -- do not wrap line
o.scrolloff = 8             -- start scrolling when 8 lines away from bottom (or top)
o.colorcolumn = '80'
o.errorbells = false

-- Matching and searching
o.ignorecase = true         -- case insensitive search
o.smartcase = true          -- once explicitly use uppercase, will no longer be case insensitive
o.hlsearch = true           -- highlight matching search pattern, do :noh to hide after
o.incsearch = true          -- highlihgt matching search pattern as the query is being typed in

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Map <leader>
g.mapleader = ' '
g.maplocalleader = ' '
