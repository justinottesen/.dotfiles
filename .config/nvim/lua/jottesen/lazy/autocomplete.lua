return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = "make install_jsregexp",
            dependencies = {},
            opts = {},
        },
        "folke/lazydev.nvim",
    },
    opts = {
        keymap = {
            preset = "default"
        },
        appearance = { nerd_font_variant = "mono" },
        completion = {
            documentation = { auto_show = false, auto_show_delay_ms = 500 }
        },
        sources = {
            default = { "lsp", "path", "snippets", "lazydev" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 }
            }
        },

        snippets = { preset = "luasnip" },
        fuzzy = {
            implemetation = "prefer_rust_with_warning",
            build = "cargo build --release"
        },
        signature = { enabled = true }
    }
}
