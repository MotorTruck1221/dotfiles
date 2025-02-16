return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "c",
                "lua",
                "ruby",
                "go",
                "rust",
                "typescript",
                "zig",
                "astro",
                "vim"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additonal_vim_regex_highlighting = false
            }
        }
    end
}
