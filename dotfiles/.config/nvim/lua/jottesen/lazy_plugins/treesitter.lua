return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
    opts = {
        highlight = { enable = true },
        indent = { enable = true},
        autotage = { enable = true},
        ensure_installed = {
            "c",
            "cpp",
            "go",
            "lua",
        },
        auto_install = false,
    },
}
