return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = (function()
                if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then return end
                return "make install_jsregexp"
            end)(),
            opts = {},
        },
    },
    opts = {
        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
        signature = { enabled = true },

        keymap = {
            ["<C-y"] = { "accept" },
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)

        vim.api.nvim_create_autocmd({ "InsertLeave", "CursorMovedI" }, {
            callback = function()
                local ok, ls = pcall(require, "luasnip")
                if not ok then return end
                if ls.in_snippet() then
                    ls.unlink_current()
                end
            end,
        })
    end,
}
