require('tokyonight').setup({
    style = 'moon',
    transparent = true,
    transparent_sidebar = true,
    dim_inactive = true,
})

require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = false,
	disable_italics = false,
})

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { },
    functionStyle = { },
    keywordStyle = { },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,         -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

vim.cmd('colorscheme tokyonight')
