require('tokyonight').setup({
    style = 'night',
    transparent = true,
    transparent_sidebar = true,
    dim_inactive = true,
})

require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
})

vim.cmd('colorscheme rose-pine')
