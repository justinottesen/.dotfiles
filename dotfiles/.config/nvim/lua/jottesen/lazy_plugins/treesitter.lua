return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Install parsers (async). First run will download + compile.
        require("nvim-treesitter").install({ "c", "cpp", "cmake", "go", "lua", "nix", "asm", "rust", "python" })

        -- The new nvim-treesitter API doesn't register FileType autocmds for highlighting.
        -- Neovim's built-in auto-highlight only covers bundled parsers (lua, c, vim, etc.).
        -- This autocmd starts treesitter highlighting for all buffers where a parser is available.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
                if lang then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })
    end,
}
