return {
    "OXY2DEV/markview.nvim",
    config = function()
        require('markview').setup({
            html = {
                enable = true,
                tags = {
                    enable = true,
                    default = {
                        conceal = false,
                        hl = nil
                    },
                    entities = {
                        enable = true,
                        h1 = nil
                    }
                }
            },
            preview = {
                splitview_winopts = {
                    split = "right"
                }
            }
        })
    end
}
