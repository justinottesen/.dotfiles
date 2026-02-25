return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Install parsers (async). First run will download + compile.
        require("nvim-treesitter").install({ "c", "cpp", "cmake", "go", "lua", "nix" })
    end,
}
