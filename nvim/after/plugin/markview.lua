require("markview").setup({
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
    split_conf = {
        split = "right"
    }
})
