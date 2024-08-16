return {
    "allaman/emoji.nvim",
    version = "1.0.0",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        enable_cmp_integration = true,
    },
    config = function (_, opts)
        require("emoji").setup(opts)
        require("telescope").load_extension("emoji")
    end
}
