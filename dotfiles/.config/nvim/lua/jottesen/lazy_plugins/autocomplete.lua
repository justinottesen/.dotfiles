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
    },
}
