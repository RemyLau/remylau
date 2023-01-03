local null_ls = require("null-ls")

require("mason-null-ls").setup({
    automatic_setup = true,
    ensure_installed = {
        "actionlint",
        "jq",
        "stylua",
    }
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.actionlint,
    },
})

require("mason-null-ls").setup_handlers {
    -- All sources with no handler get passed here
    function(source_name, methods)
        -- To keep the original functionality of `automatic_setup = true`,
        -- please add the below.
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
}

null_ls.setup()
