require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  rainbow = {
      enable = true,
  },

  playground = {
      enable = true,
  },
}

require'treesitter-context'.setup {
    enable = true,          -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer',   -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'

    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
        'class',
        'function',
        'method',
        -- 'for', -- These won't appear in the context
        -- 'while',
        -- 'if',
        -- 'switch',
        -- 'case',
    },
}
