local highlight = {
    "Function",
    "Label",
    -- "CursorColumn",
    -- "Whitespace",
    -- "IblIndent",
    -- "IblScope",
    -- "LineNr",
}
local char = "▏"
-- local char = "▎"
-- local char = "│"
-- local char = "╎"
-- local char = "┆"
-- local char = "┊"

Prequire("ibl").setup {
    enabled = true,
    debounce = 200,
    indent = {
        -- highlight = highlight,
        char = char,
        smart_indent_cap = true,
    },
    viewport_buffer = { min = 30 },
    scope = {
        enabled = true,
        char = char,
        show_start = true,
        show_end = true,
        show_exact_scope = false,
        injected_languages = true,
        -- highlight = highlight,
    },
}
