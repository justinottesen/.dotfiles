return {
    "nvim-telescope/telescope.nvim", version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    config = function()
        require("telescope").setup {
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown() },
            },
        }

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")

        local builtin = require("telescope.builtin")

        -- Searches everything, all files
        vim.keymap.set("n", "<leader>se", function()
                builtin.find_files {
                    hidden = true,
                    no_ignore = true,
                    no_ignore_parent = true,
                }
            end, { desc = "[S]earch [E]verything" })

        local most_finder = function()
            builtin.find_files {
                hidden = true,
                no_ignore = true,
                no_ignore_parent = true,
                file_ignore_patterns = {
                    "%.git/",
                }
            }
        end

        -- Searches most, has some typical defaults to ignore
        vim.keymap.set("n", "<leader>sm", most_finder, { desc = "[S]earch [M]ost" })

        -- Search Files (expected default); respect .gitignore, fall back to most outside git repos
         vim.keymap.set("n", "<leader>sf", function()
                local ok = pcall(builtin.git_files, {
                    show_untracked = true,
                })
                if not ok then
                    most_finder()
                end
            end, { desc = "[S]earch [F]iles" })

        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>ss", builtin.find_files, { desc = "[S]earch [S]elect Telescope" })
        vim.keymap.set({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files ('.' for repeat)" })
        vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end,
            { desc = "[S]earch [/] in Open Files" })
        vim.keymap.set("n", "<leader>sn", function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end,
            { desc = "[S]earch [N]eovim files" })
    end,
}
