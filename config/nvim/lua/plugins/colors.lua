function SetColorScheme(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = true,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "soft",
            palette_overrides = {},
            overrides = {},
            dim_active = false,
            transparent_mode = true,
        })

        SetColorScheme()
    end
}
