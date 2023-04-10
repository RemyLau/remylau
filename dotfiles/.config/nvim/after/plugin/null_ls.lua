local null_ls = require("null-ls")

require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = {
        -- "actionlint",
        "codespell",
        -- "jq",
        -- "misspell",
        -- "stylua",
    }
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.actionlint,
    },
})

require("mason-null-ls").setup({ automatic_setup = true })

null_ls.setup()
